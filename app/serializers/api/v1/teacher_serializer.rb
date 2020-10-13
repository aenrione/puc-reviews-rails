class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :global_rating
  has_many :courses
end
