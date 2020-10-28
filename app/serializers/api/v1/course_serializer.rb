class Api::V1::CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :credits, :acronym, :campus, :global_rating, :autocomplete_name
  has_one :school

  YEAR = GetCurrentYearAndSemester.for[0]
  SEMESTER = GetCurrentYearAndSemester.for[1]

  attribute :teachers do
    result = []
    object.teachers.where(teacher_courses: { semester: SEMESTER, year: YEAR }).each do |t|
      info = {
        id: t.id,
        name: t.name,
        email: t.email,
        global_rating: t.global_rating
      }
      result << info
    end
    result
  end

  attribute :rating_counts do
    {
      total: object.course_reviews.count,
      '0-1': object.course_reviews.where('rating >= ?', 0)
                   .where('rating < ?', 2).count,
      '2-3': object.course_reviews.where('rating >= ?', 2)
                   .where('rating < ?', 4).count,
      '4-5': object.course_reviews.where('rating >= ?', 4)
                   .where('rating < ?', 6).count,
      '6-7': object.course_reviews.where('rating >= ?', 6)
                   .where('rating < ?', 7).count
    }
  end
end
