class ExercisesController < ApplicationController
  def show
    @exercise = Exercise.find(params[:id])
  end

  def duplicate
    @exercise = Exercise.find(params[:id]).dup
    render :form
  end

  def index
    if params[:tag]
      @exercises = Exercise.tagged_with(params[:tag])
    else
      @exercises = Exercise.all
    end
    @tags = ActsAsTaggableOn::Tag.all
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

  def pick
    unless session[:chosen_exercises]
      session[:chosen_exercises] = []
    end
    session[:chosen_exercises] << params[:id] unless session[:chosen_exercises].include? params[:id]
    redirect_to exercises_path
  end

  def unpick
    session[:chosen_exercises].delete(params[:id])
    redirect_to exercises_path
  end

  private
    def exercise_params
      params[:exercise].permit(:wording, :solution, :tag_list, :difficulty)
    end
end
