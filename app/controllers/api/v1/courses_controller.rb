class Api::V1::CoursesController < Api::V1::BaseController
  before_action :authenticate_v1_user!

  def index
    render json: Course.all
  end

  def show
    render json: Course.find(params[:id])
  end
end
