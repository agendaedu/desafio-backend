require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  
  describe "GET #index" do
    let(:title) { "Ano-2021.csv" }
    let(:deputy) { deputy_with_expenditures }

    it "return file_ceaps" do
      deputy
      get :index
      expect(assigns(:deputes)).to eq([deputy])
      expect(response).to render_template("index")
    end

    it "return [] when not exist file_ceaps" do
      get :index
      expect(assigns(:deputes)).to eq([])
      expect(response).to render_template("index")
    end
  end
end
