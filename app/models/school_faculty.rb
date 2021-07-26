class SchoolFaculty < ApplicationRecord
  belongs_to :school
  belongs_to :faculty
  validates :faculty_id, :school_id, presence: true
end

# == Schema Information
#
# Table name: school_faculties
#
#  id         :bigint(8)        not null, primary key
#  school_id  :bigint(8)        not null
#  faculty_id :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_school_faculties_on_faculty_id  (faculty_id)
#  index_school_faculties_on_school_id   (school_id)
#
# Foreign Keys
#
#  fk_rails_...  (faculty_id => faculties.id)
#  fk_rails_...  (school_id => schools.id)
#
