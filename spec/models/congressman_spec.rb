require 'rails_helper'

RSpec.describe Congressman, type: :model do
  describe 'Validations' do
    it { should validate_uniqueness_of(:cpf) }
  end
end
