class ApplicationController < ActionController::Base
  protect_from_forgery

  def subject_of_grade(grade,previous_subject)

    previous_subject || 0
    @subject = Subject.where('id > ?',previous_subject).first

    return @subject

  end

end
