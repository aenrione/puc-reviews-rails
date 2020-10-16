class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :credits, :acronym, :campus, :global_rating
  has_many :teachers
  has_one :school
end
