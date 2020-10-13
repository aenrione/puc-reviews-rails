class Api::V1::TeachersController < Api::V1::BaseController
  before_action :authenticate_v1_user!

  def index
    render json: Teacher.all
  end

  def show
    render json: Teacher.find(params[:id])
  end
end
