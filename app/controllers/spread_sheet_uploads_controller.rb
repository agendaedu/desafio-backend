require 'csv'

class SpreadSheetUploadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    ProcessSpreadsheetWorker.perform_async(file_params[:file].path)

    render json: { message: "processing" }, status: :created
  end

  private

  def file_params
    params.permit(:file)
  end
end
