class Annotation < ActiveRecord::Base

  belongs_to :classification
  has_and_belongs_to_many :data_points

  validates_presence_of :data_sets
  validates_presence_of :subject_id

	def as_json(opts = {})
    {
      data_points: data_points
    }
  end

end