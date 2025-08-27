class ProcessRecordsJob < ApplicationJob
  queue_as :default

  def perform(args)
    Process::Main.run(args)
  end
end
