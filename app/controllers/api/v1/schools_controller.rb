class Api::V1::SchoolsController < Api::V1::BaseController
  def index
    render json: School.all
  end

  def show
    render json: School.find(params[:id])
  end

  def create
    if current_v1_user.student?
      raise 'Estudiantes no tienen este privilegio'
    end

    school = School.new(
      name: params[:name],
      faculty_id: params[:faculty_id]
    )
    if school.save
      render json: {}, status: :ok
    else
      raise 'Ya está en uso'
    end
  end
end
