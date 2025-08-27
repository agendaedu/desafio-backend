require "rails_helper"

RSpec.describe "SpreadSheetUploads", type: :request do
  describe "POST #create" do
    let(:file) { fixture_file_upload(file_fixture('Ano-2021.csv')) }
    context 'when a file is uploaded' do
      before do
        file

        post "/spread_sheet_uploads", params: { file: file }
      end

      it 'must return the 201 status code and message' do
        expect(response).to have_http_status(:created)
      end

      it 'must return the message' do
        expect(json_body).to have_key(:message)
      end
    end
  end
end
