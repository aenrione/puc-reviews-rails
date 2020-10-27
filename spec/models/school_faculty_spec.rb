require 'rails_helper'

RSpec.describe SchoolFaculty, type: :model do
  it 'has a valid factory' do
    expect(build(:school_faculty)).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:school) }
    it { is_expected.to belong_to(:faculty) }
  end
end
