class Annotation < ActiveRecord::Base

  belongs_to :classification
  has_and_belongs_to_many :data_points

	def as_json(opts = {})
    {
      id: id,
      data_points: data_points
    }
  end

end