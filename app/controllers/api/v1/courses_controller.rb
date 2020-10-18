class Api::V1::CoursesController < Api::V1::BaseController
  def index
    render json: Course.all
  end

  def show
    render json: Course.find(params[:id])
  end

  def create
    if current_v1_user.student?
      raise 'Estudiantes no tienen este privilegio'
    end
    course = Course.new(
      name: params[:name],
      credits: params[:credits],
      acronym: params[:acronym],
      school_id: params[:school_id]
    )
    if course.save
      render json: {}, status: :ok
    else
      raise 'No se pudo crear, revise parametros'
    end
  end

  def search_select_json
    output = []
    Course.all.each { |course| output << { id: course.id, name: course.name } }
    render json: output
  end
end
