class UploadsController < ApplicationController
  def index
    @uploads = Upload.order("created_at DESC").page(params[:page])
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    respond_to do |format|
      if @upload.save
        UploadWorker.perform_async(@upload.id)
        format.html { redirect_to uploads_url, notice: "upload was successfully created." }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: "Upload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:csv_file)
  end
end
