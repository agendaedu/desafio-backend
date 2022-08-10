require 'rails_helper'
RSpec.describe UploadWorker, type: :worker do
  
  subject(:call_worker) { described_class.perform_async }
  
  describe '#perform' do
    before {call_worker}
    it 'enqueues services in the default queue' do
      assert_equal :default, (described_class.queue).to_sym
    end
  end

end