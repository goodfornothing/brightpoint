class ApplicationController < ActionController::Base
  protect_from_forgery

  def subject_of_grade(grade,previous_subject)

  	# if density > then easy medium hard

    @subject = Subject.where('id > ?',previous_subject).first if previous_subject

    if @subject.nil?
    	@subject = Subject.create!
    	@subject.data_points = DataPoint.limit(1000)
    end

    return @subject

  end

end
