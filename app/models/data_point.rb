class DataPoint < ActiveRecord::Base
  
  attr_accessible :chromosome, :end_point, :probe, :start_point, :y_point
  
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :annotations

  def as_json(opts = {})
    {
      start: start_point,
      end: end_point,
      y: y_point.to_f
    }
  end

end