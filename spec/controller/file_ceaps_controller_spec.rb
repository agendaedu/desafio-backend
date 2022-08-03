require 'rails_helper'


include ActionDispatch::TestProcess::FixtureFile
RSpec.describe FileCeapsController, type: :controller do

  describe "POST #process_file" do
  let(:title) { "Ano-2021.csv" }
    context "success" do
      before do
        post :process_file, params: {
          name: title,
          file: fixture_file_upload("spec/support/assets/files/Ano-2021.csv")
        }, format: :json
      end
      it { expect(response).to have_http_status(:ok) }
      # it { expect(FileCnab.count).to eq(1) }
      # it { expect(FileCnab.last.title).to eq(title) }
    end
  end
end
