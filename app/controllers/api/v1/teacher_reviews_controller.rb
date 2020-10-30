class Api::V1::TeacherReviewsController < Api::V1::BaseController
  def index
    render json: TeacherReview.all.limit(50)
  end

  def show
    render json: TeacherReview.find(params[:id])
  end

  def teacher_reviews
    render json: TeacherReview.where(teacher_id: params[:teacher_id])
  end

  def create
    if student_present?
      student = find_or_create_student(params[:student_email], params[:student_name])
      teacher_review = TeacherReview.new(
        teacher_id: params[:teacher_id],
        course_id: params[:course_id],
        rating: params[:rating],
        general_comment: params[:general_comment],
        positive_comment: params[:positive_comment],
        negative_comment: params[:negative_comment],
        anonymous: params[:anonymous],
        student_id: student.id
      )
      if teacher_review.save
        UpdateEntityRating.for(teacher_id: params[:teacher_id])
        render json: {}, status: :ok
      else
        raise 'Ya ha escrito sobre este profesor y ramo'
      end
    end
  end

  def latest_reviews
    n = params[:n].present? ? params[:n].to_i : 5
    render json: TeacherReview.last(n) + CourseReview.last(n)
  end
end
