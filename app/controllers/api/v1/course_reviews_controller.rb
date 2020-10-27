class Api::V1::CourseReviewsController < Api::V1::BaseController
  def index
    render json: CourseReview.all.limit(100)
  end

  def course_reviews
    render json: CourseReview.where(course_id: params[:course_id])
  end

  def show
    render json: CourseReview.find(params[:id])
  end

  def create
    authenticate_v1_user!
    course_review = CourseReview.new(
      user_id: current_v1_user.id,
      course_id: params[:course_id],
      rating: params[:rating],
      general_comment: params[:general_comment],
      positive_comment: params[:positive_comment],
      negative_comment: params[:negative_comment]
    )
    if course_review.save
      UpdateEntityRating.for(course_id: params[:course_id])
      render json: {}, status: :ok
    end
  end
end
