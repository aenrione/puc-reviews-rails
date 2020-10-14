class Api::V1::TeachersController < Api::V1::BaseController
  def index
    render json: Teacher.all
  end

  def show
    render json: Teacher.find(params[:id])
  end

  def courses
    teacher = Teacher.find(params[:id])
    render json: teacher.courses
  end
end
