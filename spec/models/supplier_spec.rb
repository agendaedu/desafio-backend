require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe "validations" do
    let(:supplier) { build(:supplier)}
    let(:without_txt_fornecedor) { build(:supplier, txt_fornecedor: nil) }
    let(:without_txt_cnpj_cpf) { build(:supplier, txt_cnpj_cpf: nil)}

    it "when no has txt_fornecedor" do
      expect(without_txt_fornecedor).to_not be_valid
    end

    it "when no has txt_cnpj_cpf" do
      expect(without_txt_cnpj_cpf).to_not be_valid
    end

    it "valid" do
      expect(supplier).to be_valid
    end
  end
end
