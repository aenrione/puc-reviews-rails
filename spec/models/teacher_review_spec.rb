require 'rails_helper'

RSpec.describe TeacherReview, type: :model do
  it 'has a valid factory' do
    expect(build(:teacher_review)).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_presence_of(:general_comment) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:course) }
    it { is_expected.to belong_to(:student) }
    it { is_expected.to belong_to(:teacher) }
  end
end
