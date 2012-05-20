class Api::V1::SubjectsController < ApplicationController
  
  before_filter :response_headers
	respond_to :json

	def index
		@subjects = Subject.all
		respond_with @subjects
	end

	def next
		@subject = Subject.first
		respond_with @subject
	end

	protected
		def response_headers
			response.headers["Access-Control-Allow-Origin"] = "*"
		end

end