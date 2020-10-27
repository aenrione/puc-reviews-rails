class Api::V1::TeacherCoursesController < Api::V1::BaseController
  def index
    render json: TeacherCourse.all.limit(100)
  end

  def show
    render json: TeacherCourse.find(params[:id])
  end

  def create
    if current_v1_user.student?
      raise 'Estudiantes no tienen este privilegio'
    end
    teacher_course = TeacherCourse.new(
      teacher_id: params[:teacher_id],
      course_id: params[:course_id]
    )
    if teacher_course.save
      render json: {}, status: :ok
    else
      raise 'Ya está en uso'
    end
  end
end