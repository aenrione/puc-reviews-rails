class Faculty < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :schools, dependent: :nullify
end

# == Schema Information
#
# Table name: faculties
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
