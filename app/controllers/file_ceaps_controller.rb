class FileCeapsController < ApplicationController

  def index
    @q = FileCeap.ransack(params[:q])
    @pagy, @file_ceaps = pagy(@q.result(distinct: true), items: 10)

    respond_to do |format|
      format.html
    end
  end

  def new
    @file_ceap = FileCeap.new
    respond_to do |format|
      format.js
    end
  end


  def create
    @file_ceap = FileCeap.new(params_file_ceap)
    respond_to do |format|
      if @file_ceap.save
        FileJob.perform_later @file_ceap.id
        flash[:success] = t('.in_process')
        format.html { redirect_to file_ceaps_url }
      else
        flash[:error] = @file_ceap.errors.full_messages
        format.js
      end
    end
  end

  private

  def params_file_ceap
    params.require(:file_ceap).permit(:title, :avatar)
  end
end

