class FileJob < ApplicationJob
  queue_as :default

  def perform(id)
    file_ceap = FileCeap.find id
    Process::Creator.run(file_ceap)
  end
end
