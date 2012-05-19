class Api::V1::ClassificationsController < ApplicationController
  
  respond_to :json
  
  def new
  	response.headers["Access-Control-Allow-Origin"] = "*"
  	@classification = Classification.new
    respond_with @classification
  end
  
end