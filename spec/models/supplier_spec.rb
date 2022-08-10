require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:cpf_cnpj) }
end
