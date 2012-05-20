class Api::V1::DataPointsController < ApplicationController
  
  before_filter :response_headers
  respond_to :json
  
  def index
    @data_point = DataPoint.where(['start_point >= ?', params[:start] || 0]).limit(params[:size] || 100)
    respond_with @data_point
  end

  protected
		def response_headers
			response.headers["Access-Control-Allow-Origin"] = "*"
		end
  
end