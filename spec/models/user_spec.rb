require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_one(:farm) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:rescuer_trailer_capacity) }
    it { should validate_presence_of(:address) }
  end
end
