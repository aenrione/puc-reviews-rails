require 'rails_helper'

RSpec.describe School, type: :model do
  it 'has a valid factory' do
    expect(build(:school)).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
