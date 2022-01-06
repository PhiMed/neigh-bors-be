require 'rails_helper'

RSpec.describe Mission, type: :model do
  describe 'relationships' do
    it { should belong_to(:user).optional }
  end
end
