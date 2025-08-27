require 'rails_helper'

RSpec.describe FiscalDocument, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:deputy) }
  end
end
