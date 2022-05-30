class ApplicationController < ActionController::Base
  include Pagy::Backend
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def user_teacher
    unless current_user.teacher?
      redirect_to root_path
    end
  end

end
