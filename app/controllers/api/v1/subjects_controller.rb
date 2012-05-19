class Api::V1::SubjectsController < ApplicationController
  
	respond_to :json

	def index
		@subjects = Subject.all
		respond_with @subjects
	end

	def random
		@subject = Subject.first
		respond_with @subject
	end

end