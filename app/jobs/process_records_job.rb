class ProcessRecordsJob < ApplicationJob
  queue_as :default

  def perform(args, processed, file_id)
    Imports::ImportLines.run(args, processed, file_id)
  end
end
