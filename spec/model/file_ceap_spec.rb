require 'rails_helper'

include ActionDispatch::TestProcess::FixtureFile
RSpec.describe FileCeap, type: :model do

  let(:file_ceap) { create(:file_ceap, :with_attachment) }
  let(:without_title) { attributes_for(:file_ceap, :with_attachment, title: nil)}
  let(:without_attachement) { attributes_for(:file_ceap)}
  describe "valid model file_ceap" do
    it "is not valid without title" do
      expect(described_class.new(without_title)).to_not be_valid
    end

    it "is not valid without an attachment" do
      expect(described_class.new(without_attachement)).to_not be_valid
    end

    it 'is valid with an attachment' do
      expect(file_ceap).to be_valid
    end
  end
end