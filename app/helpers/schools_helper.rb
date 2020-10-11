# == Schema Information
#
# Table name: schools
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  faculty_id :bigint(8)
#
# Indexes
#
#  index_schools_on_faculty_id  (faculty_id)
#
module SchoolsHelper
end
