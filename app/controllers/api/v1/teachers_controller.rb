class Api::V1::TeachersController < Api::V1::BaseController
  def index
    render json: Teacher.all.limit(100)
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

  def search_teacher
    teachers = Teacher.all

    if params[:school_id].present?
      teachers = School.find(params[:school_id]).teachers
    elsif params[:faculty_id].present?
      teachers = Faculty.find(params[:faculty_id])
    end
    if params[:teacher_name].present?
      teachers = teachers.where('lower(name) LIKE ?', "%#{params[:teacher_name].downcase}%").limit(25)
    end
    if params[:rating_min].present? && params[:rating_max]
      teachers = teachers.where("global_rating >= ?",  params[:rating_min].to_i)
                         .where("global_rating < ?",  params[:rating_max].to_i + 1)
    end

    json_results = []

    teachers.limit(75).each do |teacher|
      temp = { "id": teacher.id, "name": teacher.name,
               "global_rating": teacher.global_rating }
      json_results.append(temp)
    end

    render json: json_results
  end

  def courses
    teacher = Teacher.find(params[:id])
    render json: teacher.courses
  end

  def autocomplete_search
    teachers = Teacher.where('lower(name) LIKE ?', "%#{params[:name].downcase}%").limit(25)
    courses = Course.where('lower(name) LIKE ?', "%#{params[:name].downcase}%").limit(25)

    json_results = []

    teachers.each do |teacher|
      temp = { "info": { id: teacher.id, type: "teacher" },
               "name": teacher.name }
      json_results.append(temp)
    end
    courses.each do |course|
      temp = { "info": { id: course.id, type: "course" },
               "name": course.autocomplete_name }
      json_results.append(temp)
    end

    render json: json_results
  end

  def get_best_teachers
    teachers = Teacher.where('global_rating > ?', 0).order(global_rating: :desc).limit(10)

    json_results = []

    teachers.each do |teacher|
      if teacher.teacher_reviews.order(rating: :desc).any?
        best_comment = teacher.teacher_reviews.order(rating: :desc).first.general_comment
      end
      temp = { "id": teacher.id, "name": teacher.name,
               "rating": teacher.global_rating,
               "best_comment": best_comment || '' }
      json_results.append(temp)
    end

    render json: json_results
  end

  def get_reviews
    teacher_reviews = TeacherReview.where(teacher_id: params[:teacher_id])
                                   .where('rating >= ?', params[:min].to_i)
                                   .where('rating < ?', params[:max].to_i + 1)
                                   .order(rating: :desc)

    render json: teacher_reviews
  end
end
