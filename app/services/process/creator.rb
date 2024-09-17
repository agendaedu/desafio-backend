module Process
  class Creator < ::Base
    attr_accessor :file
    def initialize(file)
      @file = file
    end

    def self.run(file)
      new(file).run
    end

    def run
      process
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