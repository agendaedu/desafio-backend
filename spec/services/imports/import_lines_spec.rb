require 'rails_helper'

RSpec.describe Imports::ImportLines, type: :service do
  include_examples "data_csv"
  let(:file_ceap) { create(:file_ceap, :with_attachment)}
  describe "receive data" do
    before { described_class.run(line, true, file_ceap.id) }

    it { expect(Supplier.count).to eq(1) }
    it { expect(Expenditure.count).to eq(1) }
    it { expect(Deputy.count).to eq(1) }
    it { expect(file_ceap.status).to eq("processed")}
  end
end
