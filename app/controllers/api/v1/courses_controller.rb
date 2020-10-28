class Api::V1::CoursesController < Api::V1::BaseController
  def index
    render json: Course.all.limit(50)
  end

  def show
    render json: Course.find(params[:id])
  end

  def search_course
    courses = Course.all

    if params[:school_id].present?
      courses = School.find(params[:school_id]).courses
    elsif params[:faculty_id].present?
      courses = Faculty.find(params[:faculty_id]).courses
    end

    if params[:rating_min].present? && params[:rating_max]
      courses = courses.where("global_rating >= ?",  params[:rating_min].to_i)
                       .where("global_rating < ?",  params[:rating_max].to_i + 1)
    end

    if params[:acronym].present?
      courses = courses.where("lower(acronym) LIKE ?", "%#{params[:acronym].downcase}%")
    end

    if params[:course_name].present?
      courses = courses.where("lower(name) LIKE ?", "%#{params[:course_name].downcase}%")
    end
    json_results = []

    courses.limit(30).each do |course|
      temp = { "id": course.id,
               "name": course.name,
               "acronym": course.acronym,
               "global_rating": course.global_rating,
               "autocomplete_name": course.autocomplete_name }
      json_results.append(temp)
    end

    render json: json_results
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

  def get_reviews
    course_review = CourseReview.where(course_id: params[:course_id])
                                .where('rating >= ?', params[:min].to_i)
                                .where('rating < ?', params[:max].to_i + 1)
                                .order(rating: :desc)

    render json: course_review
  end
end
