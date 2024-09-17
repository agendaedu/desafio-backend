require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe FileJob, type: :job do

  let(:file_ceap) { create(:file_ceap, :with_attachment) }

  describe "sidekiq job" do
    it 'should respond to #perform' do
      expect(described_class.new).to respond_to(:perform)
    end

    it 'process file' do
      ActiveJob::Base.queue_adapter = :test
      described_class.perform_later(file_ceap.id)
      byebug
      expect(described_class).to have_been_enqueued
    end
  end
end
