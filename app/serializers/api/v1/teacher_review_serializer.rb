class Api::V1::TeacherReviewSerializer < ActiveModel::Serializer
  attributes :id, :general_comment, :positive_comment, :rating, :negative_comment,
             :anonymous
  has_one :teacher
  has_one :course
  has_one :user
  has_one :student
end
