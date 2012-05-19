class Api::V1::ClassificationsController < ApplicationController
  
  respond_to :json
  
  def new
  	@classification = Classification.create
    respond_with @classification
  end
  
end