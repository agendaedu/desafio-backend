require 'rails_helper'

RSpec.describe "Deputies", type: :request do
  describe "GET #index" do
    context "when the deputies are loaded in a list" do
      let(:deputy1) { create(:deputy, uf_acronym: "BH") }
      let(:deputy2) { create(:deputy, uf_acronym: "AL") }
      let(:deputy3) { create(:deputy, uf_acronym: "BA") }
      let(:fiscal_document1) { create(:fiscal_document, deputy_id: deputy1.id, net_value: 200.0) }
      let(:fiscal_document1_2) { create(:fiscal_document, deputy_id: deputy1.id, net_value: 100.0) }
      let(:fiscal_document2) { create(:fiscal_document, deputy_id: deputy2.id) }
      let(:fiscal_document3) { create(:fiscal_document, deputy_id: deputy3.id) }

      before do
        fiscal_document1
        fiscal_document1_2
        fiscal_document2
        fiscal_document3

        get "/deputies"
      end

      it "must return 200 status code " do
        expect(response).to have_http_status(:ok)
      end

      it "must return the attributes in first element" do
        expect(json_body[0]).to include(:id, :name, :deputy_photo, :cpf, :uf_acronym,
                                        :party_acronym, :sub_quota_number, :expenses,
                                        :sub_quota_description, :max_expense,
                                        :expenses_sum)
      end

      it "must return the attributes of the first expense array" do
        expect(json_body[0][:expenses][0]).to include(:issue_date, :net_value, :supplier,
                                                      :document_url)
      end

      it "must return the expenses sum correct result" do
        expect(json_body[0][:expenses_sum]).to eq(300)
      end

      it "must return the max expense value" do
        expect(json_body[0][:max_expense]).to eq(200)
      end
    end
  end
end
