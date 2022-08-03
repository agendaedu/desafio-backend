class FileCeapsController < ApplicationController
  def index
    @file_ceaps = FileCeap.all

    respond_to do |format|
      format.html
    end
  end

  def process_file
    byebug
    FileCeapsJob.perform_later params[:file].to_json
    head :ok
  end
end

