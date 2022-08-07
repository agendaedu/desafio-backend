class ProcessRecordsJob < ApplicationJob
  queue_as :default

  def perform(args)
    Imports::ImportLines.run(args)
  end
end
