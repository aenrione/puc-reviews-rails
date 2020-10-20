class Api::V1::TeacherReviewsController < Api::V1::BaseController
  def index
    render json: TeacherReview.all
  end

  def show
    render json: TeacherReview.find(params[:id])
  end

  def teacher_reviews
    render json: TeacherReview.where(teacher_id: params[:teacher_id])
  end

  def create
    authenticate_v1_user!
    teacher_review = TeacherReview.new(
      user_id: current_v1_user.id, teacher_id: params[:teacher_id],
      course_id: params[:course_id],
      rating: params[:rating],
      general_comment: params[:general_comment],
      positive_comment: params[:positive_comment],
      negative_comment: params[:negative_comment]
    )
    if teacher_review.save
      UpdateEntityRating.for(teacher_id: params[:teacher_id])
      render json: {}, status: :ok
    else
      raise 'No se pudo crear, revise parametros'
    end
  end

  def latest_reviews
    n = params[:n].present? ? params[:n].to_i : 5
    render json: TeacherReview.last(n) + CourseReview.last(n)
  end
end
