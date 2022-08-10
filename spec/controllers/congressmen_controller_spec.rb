require 'rails_helper'

RSpec.describe CongressmenController, type: :controller do
  # describe "GET /index" do
  #   it "returns http success" do
  #     get "/congressmen/index"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

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

end
