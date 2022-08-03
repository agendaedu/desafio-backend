module Imports
  class Creator
    attr_accessor :file, :title

    def initialize(file)
      @file = file.tempfile
      @title = file.original_filename
    end

    def self.run(file)
      new(file).run
    end

    def run
      process
    end

    private

    def process
      instance_file
    end

    def instance_file
      attachment = FileCeap.new(title: title)
      attachment.avatar.attach(io: file, filename: file)
      attachment.save
      
      #Process::Files.run(read_file(attachment))
      attachment
    rescue => e
      attachment.destroy
      e.message
    end
  end
end
