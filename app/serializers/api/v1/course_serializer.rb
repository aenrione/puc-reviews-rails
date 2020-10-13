class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :credits, :acronym, :campus
  has_many :teachers
  has_one :school
end
