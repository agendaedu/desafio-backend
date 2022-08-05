class HomesController < ApplicationController
  before_action :search_depute, only: [:show]
  def index
    @q = Deputy.ransack(params[:q])
    @pagy, @deputes = pagy(@q.result.includes(expenditures: :supplier).order(maior_despesa: :desc))

    respond_to do |format|
      format.html
    end
  end

  def show 
    @pagy, @expenditures = pagy(@depute.expenditures, items: 10)
  end

  private

  def search_depute
    @depute = Deputy.find params[:id]
  end
end
