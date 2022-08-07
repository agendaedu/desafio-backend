require 'rails_helper'

RSpec.describe Expenditure, type: :model do

  describe "validations" do
    let(:expenditure) { build(:expenditure) }
    let(:expentiture_with_deputy) { create(:expenditure, :with_deputy, :with_supplier) }
    context "callback" do
      it "update maior_despesa when expenditure is create" do
        expentiture_with_deputy
        expect(expentiture_with_deputy.deputy.maior_despesa).to eq(expentiture_with_deputy.vlr_liquido)
      end
    end

    context "relationship" do
      it 'belongs deputy' do
        expect(expentiture_with_deputy.deputy).to be_valid
      end
    end

    context "presence" do
      it "when no has txt_fornecedor" do
        expentiture_with_deputy.txt_fornecedor = nil
        expect(expentiture_with_deputy).to_not be_valid
      end

      it "when no has data_emissao" do
        expentiture_with_deputy.data_emissao = nil
        expect(expentiture_with_deputy).to_not be_valid
      end

      it "when no has vlr_liquido" do
        expentiture_with_deputy.vlr_liquido = nil
        expect(expentiture_with_deputy).to_not be_valid
      end

      it "when no has url_documento" do
        expentiture_with_deputy.url_documento = nil
        expect(expentiture_with_deputy).to_not be_valid
      end
    end
  end
end
