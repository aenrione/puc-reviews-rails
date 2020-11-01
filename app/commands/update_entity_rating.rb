class UpdateEntityRating < PowerTypes::Command.new(teacher_id: nil, course_id: nil)
  def perform
    if @teacher_id.present?
      all_reviews = TeacherReview.where(teacher_id: @teacher_id)
      teacher = Teacher.find(@teacher_id)
      teacher.global_rating = calculate_review_score(all_reviews)
      teacher.save!
    elsif @course_id.present?
      all_reviews = CourseReview.where(course_id: @course_id)
      course = Course.find(@course_id)
      course.global_rating = calculate_review_score(all_reviews)
      course.save!
    else
      raise "Especifique una entidad"
    end
  end

  def calculate_review_score(all_reviews)
    cuantity = all_reviews.count
    rating_count = 0
    all_reviews.each do |review|
      rating_count += review.rating
    end
    rating_count / cuantity
  end
end
