class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @status = ""
    # binding.pry
    if @student.active
      @status = "This student is currently active."
    else
      @status = "This student is currently inactive."
    end
  end

  def activate
    @student = Student.find(params[:id])
    @student.active = !@student.active
    @student.save
    # binding.pry
    redirect_to student_path(params[:id])
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
