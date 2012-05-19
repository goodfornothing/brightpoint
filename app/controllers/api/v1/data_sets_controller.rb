class Api::V1::DataSetsController < ApplicationController
  
  respond_to :json
  
  def index
    @data_set = DataSet.where(['start_point >= ?', params[:start]]).limit(params[:size])
    respond_with @data_set
  end
  
end