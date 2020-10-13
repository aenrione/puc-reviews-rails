# == Schema Information
#
# Table name: courses
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  credits    :integer
#  acronym    :string
#  campus     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :bigint(8)
#
# Indexes
#
#  index_courses_on_school_id  (school_id)
#
module CoursesHelper
end
