require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    let(:subject) { build(:user) }

    it { is_expected.to be_valid }
  end
end
