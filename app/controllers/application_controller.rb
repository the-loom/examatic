class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authenticate_user!, unless: proc { sessions_controller? }
  before_action :load_course

  def login_user(user)
    session[:user_id] = user.id
    session[:subject_id] = user.subjects.first.id
    redirect_to dashboard_index_path
  end

  private
    def load_course
      Subject.current = Subject.find(session[:subject_id]) if session[:subject_id].present?
    end
    
    def authenticate_user!
      unless current_user && current_user.enabled
        redirect_to(root_path) && (return)
      end
    end

    def check_admin!
      unless current_user.admin
        redirect_to(root_path) && (return)
      end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def sessions_controller?
      controller_path.starts_with?("welcome") || controller_path.starts_with?("sessions")
    end
end
