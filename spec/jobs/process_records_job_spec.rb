require 'rails_helper'

RSpec.describe ProcessRecordsJob, type: :job do
  describe "sidekiq job" do
    let(:file_ceap) { create(:file_ceap, :with_attachment)}
    it 'should respond to #perform' do
      expect(described_class.new).to respond_to(:perform)
    end

    it 'process file' do
      ActiveJob::Base.queue_adapter = :test
      described_class.perform_later(file_ceap.id)
      expect(described_class).to have_been_enqueued
    end
  end
end
