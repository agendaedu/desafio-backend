require 'rails_helper'

RSpec.describe Imports::ImportLines, type: :service do
  include_examples "data_csv"
  describe "receive data" do
    before { described_class.run(line) }

    it { expect(Supplier.count).to eq(1) }
    it { expect(Expenditure.count).to eq(1) }
    it { expect(Deputy.count).to eq(1) }
  end
end
