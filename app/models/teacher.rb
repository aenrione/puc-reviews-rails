class Teacher < ApplicationRecord
end

# == Schema Information
#
# Table name: teachers
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  email         :string
#  global_rating :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
