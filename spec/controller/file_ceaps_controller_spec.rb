require 'rails_helper'
require_relative "../support/devise"

include ActionDispatch::TestProcess::FixtureFile
RSpec.describe FileCeapsController, type: :controller do

  describe "POST #create" do
    login_user
    let(:title) { }
    let(:path) { "spec/support/assets/files/#{title}" }

    before do
      post :create, params: {
        file_ceap: {
        title: title,
        avatar: fixture_file_upload(path)
      }}, format: :html
    end

    context "file_ceap valid" do
      let(:title) { "Ano-2021.csv" }
      it { expect(FileCeap.count).to eq(1) }
      it { expect(FileCeap.last.title).to eq(title) }
      it { expect(assigns[:file_ceap].status).to eq("in_process") }
      it { expect(response.media_type).to eq("text/html") }
      it { expect(response).to redirect_to(action: :index) }
    end

    context "file_ceap invalid type" do
      let(:title) { "Ano-2021-invalid.css" }
      it { expect(assigns[:file_ceap].status).to eq("unprocessed") }
      it { expect(FileCeap.count).to eq(0) }
      it { expect(assigns[:file_ceap].errors.full_messages.join("")).to include(I18n.t(".format_invalid")) }
      it { expect(response).to redirect_to(action: :index)}
    end

    context "file_ceap invalid uf" do
      let(:title) { "Ano-2021-invalid.csv" }
      it { expect(FileCeap.count).to eq(1) }
      it { expect(response).to redirect_to(action: :index)}
    end
  end

  describe "GET #index" do
    login_user
    let(:title) { "Ano-2021.csv" }
    before { get :index }
    
    let(:file_ceap) { create(:file_ceap, :with_attachment, title: title) }
    it "return file_ceaps" do
      file_ceap
      expect(assigns(:file_ceaps)).to eq([file_ceap])
      expect(response).to render_template("index")
    end

    it "return [] when not exist file_ceaps" do
      expect(assigns(:file_ceaps)).to eq([])
      expect(response).to render_template("index")
    end
  end
end
