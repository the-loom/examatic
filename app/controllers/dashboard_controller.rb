class DashboardController < ApplicationController
  def index
    @exams = Exam.count
    @exercises = Exercise.count
  end
end
