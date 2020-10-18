class Api::V1::TeachersController < Api::V1::BaseController
  def index
    render json: Teacher.all
  end

  def show
    render json: Teacher.find(params[:id])
  end

  def create
    if current_v1_user.student?
      raise 'Estudiantes no tienen este privilegio'
    end
    teacher = Teacher.new(
      name: params[:name],
      email: params[:email]
    )
    if teacher.save
      render json: {}, status: :ok
    else
      raise 'No se pudo crear, revise parametros'
    end
  end

  def courses
    teacher = Teacher.find(params[:id])
    render json: teacher.courses
  end

  def autocomplete_search
    # query = params[:q][:groupings]['0'][:name_contains]
    teachers = Teacher.where('lower(name) LIKE ?', "%#{params[:name].downcase}%").limit(10)
    courses = Course.where('lower(name) LIKE ?', "%#{params[:name].downcase}%").limit(10)

    json_results = []

    teachers.each do |teacher|
      temp = { "info": { id: teacher.id, type: "teacher" },
               "name": teacher.name }
      json_results.append(temp)
    end
    courses.each do |course|
      temp = { "info": { id: course.id, type: "course" },
               "name": course.name }
      json_results.append(temp)
    end

    render json: json_results
  end
end
