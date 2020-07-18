class ExercisesController < ApplicationController
  def index
    if params[:tag]
      @exercises = Exercise.kept.tagged_with(params[:tag])
    else
      @exercises = Exercise.kept
    end
    @tags = ActsAsTaggableOn::Tag.all
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

    if @exercise.update_attributes(exercise_params)
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

    session[:chosen_exercises] << exercise_id unless session[:chosen_exercises].include? exercise_id
    redirect_to exercises_path
  end

  def unpick
    session[:chosen_exercises].delete(params[:id])
    redirect_to exercises_path
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
