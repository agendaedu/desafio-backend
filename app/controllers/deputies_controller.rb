class DeputiesController < ApplicationController
  
  def index
    deputies = Deputy.all
  end
end
