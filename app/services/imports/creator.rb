module Imports
  class Creator < Imports::Base
    attr_accessor :file

    def initialize(file)
      @file = file
    end

    private

    def process
      records = read_file(file)
      records.each do |record|
        ProcessRecordsJob.perform_later(record)
      end
      file.processed!
    end
  end
end
