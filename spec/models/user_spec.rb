require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { described_class.new }

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:role) }
    it do
      expect(user).to define_enum_for(:role).with_values(
        [:super_admin, :helper, :student]
      )
    end
  end
end
