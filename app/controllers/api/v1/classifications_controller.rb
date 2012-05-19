class Api::V1::ClassificationsController < ApplicationController
  
  respond_to :json
  
  def new
  	@classification = Classification.new
    respond_with @classification
  end
  
end