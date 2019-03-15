class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = set_student
    if @student.active
     @active_value = "active"
   else
     @active_value = "inactive"
   end
  end

  def activate
    @student = set_student
    @student.active = !@student.active
    @student.save
    redirect_to student_path
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
