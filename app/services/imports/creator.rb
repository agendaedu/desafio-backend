module Imports
  class Creator < Imports::Base
    attr_accessor :file

    def initialize(file, processed = nil, file_id = nil)
      @file = file
    end

    private

    def process
      records = read_file(file)
      total = records.size
      records.each_with_index do |record, index|
        processed = index + 1 == total
        ProcessRecordsJob.perform_later(record, processed, file.id)
      end
    end
  end
end
