require 'rails_helper'

RSpec.describe Farm, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
  end
end
