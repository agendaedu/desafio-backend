class HomesController < ApplicationController
  before_action :search_depute, only: [:show]
  def index
    @q = Deputy.ransack(params[:q])
    @pagy, @deputes = pagy(@q.result.order(maior_despesa: :desc))

    respond_to do |format|
      format.html
    end
  end

  def show
    @pagy, @expenditures = pagy(@depute.expenditures, items: 10)

    respond_to do |format|
      format.html
    end
  end

  private

  def search_depute
    @depute = Deputy.includes(:expenditures).find params[:id]
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = t(".deputy_not_fount")
    redirect_to homes_url
  end
end
