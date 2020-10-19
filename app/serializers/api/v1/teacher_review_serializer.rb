class Api::V1::TeacherReviewSerializer < ActiveModel::Serializer
  attributes :id, :general_comment, :positive_comment, :rating, :negative_comment
  has_one :teacher
  has_one :course
  has_one :user
end
