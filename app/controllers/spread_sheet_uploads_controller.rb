require 'csv'

class SpreadSheetUploadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    uploaded_file = SpreadsheetUploader.new
    uploaded_file.store!(file_params[:file])

    ProcessSpreadsheetWorker.perform_async(uploaded_file.file.file)

    render json: { message: "processing" }, status: :created
  end

  private

  def file_params
    params.permit(:file)
  end
end
