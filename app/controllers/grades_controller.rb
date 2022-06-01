class GradesController < ApplicationController
  before_action :require_user_logged_in
  before_action :user_teacher
  
  def index
    @grades = Grade.all
  end
 
end
