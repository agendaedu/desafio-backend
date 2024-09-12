class HomesController < ApplicationController
  def index
    @q = Deputy.ransack(params[:q])
    @deputes = @q.result.includes(expenditures: :supplier)

    respond_to do |format|
      format.html
    end
  end
end
