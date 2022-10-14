require "rails_helper"

RSpec.describe "SpreadSheetUploads", type: :request do
  describe "POST #create" do
    # let(:file) { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/planilha_teste.xlsx")) }

    let(:file) { fixture_file_upload(file_fixture('Ano-2021.csv')) }
    context 'when a file is uploaded' do
      before do
        file

        post "/spread_sheet_uploads", params: { file: file }
      end

      it 'must return the 201 status code and message' do
        expect(response).to have_http_status(:created)
        expect(json_body).to have_key(:message)
      end
    end
  end
end
