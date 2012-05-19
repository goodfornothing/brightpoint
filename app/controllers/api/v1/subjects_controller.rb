class Api::V1::SubjectsController < ApplicationController
  
	respond_to :json

	def index
		response.headers["Access-Control-Allow-Origin"] = "*"
		@subjects = Subject.all
		respond_with @subjects
	end

	def next
		response.headers["Access-Control-Allow-Origin"] = "*"
		@subject = Subject.first
		respond_with @subject
	end

end