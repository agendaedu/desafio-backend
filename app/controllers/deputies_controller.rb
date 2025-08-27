class DeputiesController < ApplicationController
  
  def index
    deputies = Deputy.includes(:fiscal_documents)

    render json: deputies,
           each_serializer: Deputy::Index::DeputiesSerializer,
           status: :ok 
  end
end
