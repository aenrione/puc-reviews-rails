class Api::V1::TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :global_rating
  has_many :courses

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
