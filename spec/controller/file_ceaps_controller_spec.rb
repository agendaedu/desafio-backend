require 'rails_helper'


include ActionDispatch::TestProcess::FixtureFile
RSpec.describe FileCeapsController, type: :controller do

  describe "POST #create" do
    context "file_ceap valid" do
      let(:title) { "Ano-2021.csv" }
      before do
        post :create, params: {
          file_ceap: {
          title: title,
          avatar: fixture_file_upload("spec/support/assets/files/#{title}")
        }}, format: :html
      end

      it { expect(FileCeap.count).to eq(1) }
      it { expect(FileCeap.last.title).to eq(title) }
      it { expect(assigns[:file_ceap].status).to eq("unprocessed") }
      it { expect(response.media_type).to eq("text/html")}
      it { expect(response).to redirect_to(action: :index)}
    end

    context "file_ceap invalid" do
      let(:title) { "Ano-2021-invalid.csv" }
      before do
        post :create, params: {
          file_ceap: {
          title: title,
          avatar: fixture_file_upload("spec/support/assets/files/#{title}")
        }}, format: :html
      end
      it { expect(Expenditure.count).to eq(0) }
    end

  end

  describe "GET #index" do
    let(:title) { "Ano-2021.csv" }
    let(:file_ceap) { create(:file_ceap, :with_attachment, title: title) }

    it "return file_ceaps" do
      file_ceap
      get :index
      expect(assigns(:file_ceaps)).to eq([file_ceap])
      expect(response).to render_template("index")
    end

    it "return [] when not exist file_ceaps" do
      get :index
      expect(assigns(:file_ceaps)).to eq([])
      expect(response).to render_template("index")
    end
  end
end
