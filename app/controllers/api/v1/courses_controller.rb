class Api::V1::CoursesController < Api::V1::BaseController
  def index
    render json: Course.all
  end

  def show
    render json: Course.find(params[:id])
  end

  def search_select_json
    output = []
    Course.all.each { |course| output << { id: course.id, name: course.name } }
    render json: output
  end
end
