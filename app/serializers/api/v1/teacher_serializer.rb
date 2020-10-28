class Api::V1::TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :global_rating
  YEAR = GetCurrentYearAndSemester.for[0]
  SEMESTER = GetCurrentYearAndSemester.for[1]

  attribute :courses do
    result = []
    object.courses.where(teacher_courses: { semester: SEMESTER, year: YEAR }).each do |c|
      info = {
        id: c.id,
        name: c.name,
        acronym: c.acronym,
        credits: c.credits,
        campus: c.campus,
        global_rating: c.global_rating,
      }
      result << info
    end
    result
  end

  attribute :rating_counts do
    {
      total: object.teacher_reviews.count,
      '0-1': object.teacher_reviews.where('rating >= ?', 0)
                   .where('rating < ?', 2).count,
      '2-3': object.teacher_reviews.where('rating >= ?', 2)
                   .where('rating < ?', 4).count,
      '4-5': object.teacher_reviews.where('rating >= ?', 4)
                   .where('rating < ?', 6).count,
      '6-7': object.teacher_reviews.where('rating >= ?', 6)
                   .where('rating < ?', 7).count
    }
  end
end
