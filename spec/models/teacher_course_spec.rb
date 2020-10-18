require 'rails_helper'

RSpec.describe TeacherCourse, type: :model do
  it 'has a valid factory' do
    expect(build(:teacher_course)).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:course) }
    it { is_expected.to belong_to(:teacher) }
  end
end
