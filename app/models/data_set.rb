class DataSet < ActiveRecord::Base
  attr_accessible :chromosome, :end_point, :probe, :start_point, :y_point
end