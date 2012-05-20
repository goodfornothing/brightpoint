class Api::V1::SubjectsController < ApplicationController
  
  before_filter :response_headers
  caches_action :first, :cache_path => Proc.new { |c| c.params }
  caches_action :next, :cache_path => Proc.new { |c| c.params }
	respond_to :json

	def index
		@subjects = Subject.all
		respond_with @subjects
	end

	def next
		@subject = subject_of_grade([params[:grade]||'easy'],params[:previous_subject])
		respond_with @subject
	end

	protected
		def response_headers
			response.headers["Access-Control-Allow-Origin"] = "*"
		end

end