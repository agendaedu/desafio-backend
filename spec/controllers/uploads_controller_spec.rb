require 'rails_helper'

RSpec.describe UploadsController, type: :controller do
  describe "GET #index" do
    context "when user is logged in" do
      before do
        sign_in create(:user)
        get :index
      end

      it { is_expected.to respond_with(:success) }
    end

    context "when user is not logged in" do
      before { get :index }
      it { is_expected.to respond_with(:redirect) }
    end
  end

  describe "data are imported and created via upload" do
    context "when user is logged in" do
      let(:create_upload) { post :create, params: { upload: attributes_for(:upload) } }

      before { sign_in create(:user) }
      
      it "redirects to uploads" do
        expect(create_upload).to redirect_to uploads_path
      end

      it "creates upload" do
        expect {create_upload}.to change(Upload, :count).by(1)
      end
    end

    context "when user is not logged in" do
      it "does not redirect to uploads" do
        post :create, params: { upload: attributes_for(:upload) }
        expect(response).not_to redirect_to uploads_path
      end
    end
  end
end