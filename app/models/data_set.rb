class DataSet < ActiveRecord::Base
  attr_accessible :chromosome, :end_point, :probe, :start_point, :y_point
  
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :annotations

  def as_json(opts = {})
    {
      start_point: start_point,
      end_point: end_point,
      y_point: y_point.to_f,
      probe: probe,
      chromosome: chromosome
    }
  end
end