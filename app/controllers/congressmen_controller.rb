class CongressmenController < ApplicationController
  before_action :set_congressman, only: %i[show]
  def index
    @congressmen = Congressman.order("created_at DESC").page(params[:page])
  end

  def show
    
  end

  private

  def set_congressman
    @congressman = Congressman.find(params[:id])
  end
end
