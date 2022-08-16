class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  # TBD
  def enroll
    subject = Subject.find(params[:id])
    current_user.memberships << Membership.create(subject: subject)
    session[:subject_id] = subject.id
    redirect_to exercises_path
  end

  def switch
    subject = Subject.find(params[:id])
    session[:subject_id] = subject.id

    Subject.current = subject
    session[:chosen_exercises] = []
    redirect_to exercises_path
  end
end
