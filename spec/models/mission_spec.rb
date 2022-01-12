require 'rails_helper'

RSpec.describe Mission, type: :model do
  describe 'relationships' do
    it { should belong_to(:user).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:farm_id) }
  end
end
