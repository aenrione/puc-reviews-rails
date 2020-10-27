class Api::V1::CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :credits, :acronym, :campus, :global_rating
  has_many :teachers
  has_one :school

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

  attribute :autocomplete_name do
    object.autocomplete_name
  end
end
