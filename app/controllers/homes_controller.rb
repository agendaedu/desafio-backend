class HomesController < ApplicationController
  before_action :search_depute, only: [:show]
  def index
    @q = Deputy.ransack(params[:q])
    @deputes = @q.result.includes(expenditures: :supplier)

    respond_to do |format|
      format.html
    end
  end

  def show 
    @expenditures = @depute.expenditures
  end

  private

  def search_depute
    @depute = Deputy.find params[:id]
  end
end
