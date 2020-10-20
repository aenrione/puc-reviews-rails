class Api::V1::CoursesController < Api::V1::BaseController
  def index
    render json: Course.all
  end

  def show
    render json: Course.find(params[:id])
  end

  def search_course
    courses = Course.all

    if params[:school_id].present?
      courses = courses.where(school_id: params[:school_id])
    elsif params[:faculty_id].present?
      courses = courses.where(school: School.where(faculty_id: params[:faculty_id]))
    end
    if params[:rating_min].present? && params[:rating_max]
      courses = Course.where("global_rating >= ?",  params[:rating_min].to_i)
                      .where("global_rating < ?",  params[:rating_max].to_i + 1)
    end
    json_results = []

    courses.limit(20).each do |course|
      temp = { "id": course.id,
               "name": course.name,
               "global_rating": course.global_rating }
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
