class Api::V1::AnnotationsController < ApplicationController
  
  before_filter :response_headers
  respond_to :json

  def index

  	@subject = Subject.find(params[:subject])
  	@annotations = Annotation.where("classification_id IN (?)", @subject.classifications.map(&:id))

  	respond_with @annotations

  end

  protected
		def response_headers
			response.headers["Access-Control-Allow-Origin"] = "*"
		end
  
end