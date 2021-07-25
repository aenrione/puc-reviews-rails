class Api::V1::FacultiesController < Api::V1::BaseController
  def index
    render json: Faculty.all
  end

  def show
    render json: Faculty.find(params[:id])
  end

  def create
    if current_v1_user.student?
      raise 'Estudiantes no tienen este privilegio'
    end

    faculty = Faculty.new(
      name: params[:name]
    )
    if faculty.save
      render json: {}, status: :ok
    else
      raise 'No se pudo crear, revise parametros'
    end
  end
end
