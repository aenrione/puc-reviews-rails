class Api::V1::CourseReviewsController < Api::V1::BaseController
  def index
    render json: CourseReview.all.limit(50)
  end

  def course_reviews
    render json: CourseReview.where(course_id: params[:course_id])
  end

  def show
    render json: CourseReview.find(params[:id])
  end

  def create
    if student_present?
      student = find_or_create_student(params[:student_email], params[:student_name])
      course_review = CourseReview.new(
        course_id: params[:course_id],
        rating: params[:rating],
        general_comment: params[:general_comment],
        positive_comment: params[:positive_comment],
        negative_comment: params[:negative_comment],
        anonymous: params[:anonymous],
        student_id: student.id
      )
      if course_review.save
        UpdateEntityRating.for(course_id: params[:course_id])
        render json: {}, status: :ok
      else
        raise 'Ya ha escrito sobre este ramo'
      end
    end
  end
end
