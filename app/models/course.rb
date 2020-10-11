class Course < ApplicationRecord
end

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
#
