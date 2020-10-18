require 'rails_helper'

RSpec.describe Faculty, type: :model do
  it 'has a valid factory' do
    expect(build(:faculty)).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
