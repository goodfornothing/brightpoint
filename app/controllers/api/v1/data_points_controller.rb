class Api::V1::DataPointsController < ApplicationController
  
  before_filter :response_headers
  respond_to :json
  
  def index
    @data_points = DataPoint.where(['start_point >= ?', params[:start] || 0]).limit(params[:size] || 100)
    respond_with @data_points
  end

  def chromosome
    @data_points = DataPoint.where(['chromosome = ?', params[:chromosome]]).limit(params[:size] || 100)
    
    y_points = @data_points.map{|dp| dp.y_point}
    maximum = y_points.max
    minimum = y_points.min

    @gp = @data_points.group_by{|dp| dp.start_point}
    @grouped_points = Array.new
    @gp.each do |start,values|

      @grouped_points << {
        start: start,
        data: values.map(&:y_point).sort()
      }

    end

    @chromosome = {
      chromosome: {
        name: params[:chromosome],
        maximum: maximum,
        minimum: minimum,
        data_points: @grouped_points
      }
    }
    respond_with @chromosome
  end

  protected
		def response_headers
			response.headers["Access-Control-Allow-Origin"] = "*"
		end
  
end