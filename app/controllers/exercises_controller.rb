class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
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

  private
    def exercise_params
      params[:exercise].permit(:wording, :solution)
    end

end
