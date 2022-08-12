class ExercisesController < ApplicationController
  def index
    if params[:tag]
      @exercises = Exercise.with_dependencies.kept.last_versions.tagged_with(params[:tag]).sorted
    else
      @exercises = Exercise.with_dependencies.kept.last_versions.sorted

    end
    @tags = ActsAsTaggableOn::Tag.all.order(name: :asc)
  end

  def archive
    @exercises = Exercise.discarded
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def duplicate
    @exercise = Exercise.find(params[:id]).dup
    render :form
  end

  def new
    @exercise = Exercise.new
    render :form
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.valid?
      @exercise.numerate
      @exercise.save
      redirect_to exercises_path
    else
      render :form
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
    render :form
  end

  def update
    @exercise = Exercise.find(params[:id])
    @exercise.assign_attributes(exercise_params)

    if @exercise.wording.changed? && !@exercise.exams.empty? && params[:force] != "true"
      origin = @exercise
      @exercise = @exercise.dup
      @exercise.version += 1
      @exercise.origin = origin
    end

    if @exercise.save
      redirect_to exercises_path
    else
      render :form
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.discard!
    redirect_to exercises_path
  end

  def undestroy
    @exercise = Exercise.find(params[:id])
    @exercise.undiscard!
    redirect_to exercises_path
  end

  def pick
    unless session[:chosen_exercises]
      session[:chosen_exercises] = []
    end
    exercise_id = params[:id].to_i
    @exercise = Exercise.find(exercise_id)

    session[:chosen_exercises] << exercise_id unless session[:chosen_exercises].include? exercise_id

    respond_to do |format|
      format.json {
        render plain: { id: @exercise.id, total: session[:chosen_exercises].size }.to_json, status: 200, content_type: "application/json"
      }
    end
  end

  def unpick
    exercise_id = params[:id].to_i
    @exercise = Exercise.find(exercise_id)
    session[:chosen_exercises].delete(exercise_id)

    respond_to do |format|
      format.json {
        render plain: { id: @exercise.id, total: session[:chosen_exercises].size }.to_json, status: 200, content_type: "application/json"
      }
    end
  end

  def toggle_flagged
    @exercise = Exercise.find(params[:id])
    @exercise.toggle_flagged!
    redirect_to exercises_path
  end

  private
    def exercise_params
      params[:exercise].permit(:wording, :solution, :tag_list, :difficulty)
    end
end
