require 'rails_helper'

RSpec.describe Deputy, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:fiscal_documents).dependent(:destroy) }
  end
end
