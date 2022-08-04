require 'rails_helper'


include ActionDispatch::TestProcess::FixtureFile
RSpec.describe FileCeapsController, type: :controller do

  describe "POST #process_file" do
  let(:title) { "Ano-2021.csv" }
    before do
      post :create, params: {
        file_ceap: {
        title: title,
        avatar: fixture_file_upload("spec/support/assets/files/Ano-2021.csv")
      }}, format: :html
    end

    it { expect(FileCeap.count).to eq(1) }
    it { expect(FileCeap.last.title).to eq(title) }
    it { expect(Expenditure.count).to eq(10) }
  end
end