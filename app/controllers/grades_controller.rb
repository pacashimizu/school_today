class GradesController < ApplicationController
  before_action :require_user_logged_in
  before_action :user_teacher
  before_action :set_grades
  
  def index
  end
  
  def promotion
    grade = Grade.find(2)
    grade.students.destroy_all

    grade = Grade.find(3)
    grade.students.update_all(grade_id: 2)
    
    grade = Grade.find(4)
    grade.students.update_all(grade_id: 3)
    
    grade = Grade.find(5)
    grade.students.update_all(grade_id: 4)

    grade = Grade.find(6)
    grade.students.update_all(grade_id: 5)
    
    grade = Grade.find(7)
    grade.students.update_all(grade_id: 6)

    render :index
  end
  
  private
  
  def set_grades
    @grades = Grade.where.not(id: 1)
  end  
end
