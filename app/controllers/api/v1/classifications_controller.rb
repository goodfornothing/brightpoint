class Api::V1::ClassificationsController < ApplicationController
  
  before_filter :response_headers
  respond_to :json

  def index

  	@subject = Subject.find(params[:subject])
  	@classifications = Classification.find_all_by_subject_id(@subject)

  	respond_with @classifications

  end
  
  def create

  	@classification = Classification.new(
  		:started => params[:started],
      :ended => params[:ended]
    )

  	@subject = Subject.find(params[:subject_id])
  	@classification.subject = @subject

  	if @classification.valid?
 
  		params[:annotations].each do |annotation|

  			annotation = eval(annotation)

  			# For the sake of simplicity/perfomance, annotations are created using a 
  			# start and end point on the x-axis for a particular subject rather 
  			# than having our clients pass back a list of data_points
  			data_points = @subject.data_points.delete_if{ |x| !(x.start_point <= annotation[:start] || x.end_point >= annotation[:end]) }

  			# Create the annotation
  			a = Annotation.new
  			a.classification = @classification
  			a.data_points = data_points
  			a.save

  		end

  	end

    @classification.save
    render :json => @classification

  end

  protected
		def response_headers
			response.headers["Access-Control-Allow-Origin"] = "*"
		end
  
end