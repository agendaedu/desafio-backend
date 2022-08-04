class FileCeapsController < ApplicationController

  def index
    @q = FileCeap.ransack(params[:q])
    @file_ceaps = @q.result(distinct: true)

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

  def process_file
    resp = Imports::Creator.run(params[:file])
    if resp.is_a?(FileCeap)
      Process::Creator.run(resp)
      redirect_to action: :index
    else
      render "new"
    end
  end
end

