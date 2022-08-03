class FileCeapsController < ApplicationController
  def index
    @file_ceaps = FileCeap.all

    respond_to do |format|
      format.html
    end
  end

  def process_file
    byebug
    # ::Process::File.run(params[:file])
    head :ok
  end
end

