class ExamsController < ApplicationController
  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def solution
    @exam = Exam.find(params[:id])
    @include_solution = true
    render :show
  end

  def new
    @exam = Exam.new
    @exam.exercises = session[:chosen_exercises].map { |exercise_id| Exercise.find(exercise_id) }
    render :form
  end

  def create
    @exam = Exam.new(exam_params)
    @exam.exercises = session[:chosen_exercises].map { |exercise_id| Exercise.find(exercise_id) }
    if @exam.valid?
      @exam.save
      session[:chosen_exercises] = []
      redirect_to exams_path
    else
      render :form
    end
  end

  def discard
    session[:chosen_exercises] = []
    redirect_to exams_path
  end

  private
    def exam_params
      params[:exam].permit(:title, :exam_date)
    end
end
