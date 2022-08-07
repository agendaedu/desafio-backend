class FileJob < ApplicationJob
  queue_as :default

  def perform(id)
    file_ceap = FileCeap.find id
    Imports::Creator.run(file_ceap)
  end
end
