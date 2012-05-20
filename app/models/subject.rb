class Subject < ActiveRecord::Base
  
	has_many :classifications
	has_and_belongs_to_many :data_points
	
  def as_json(opts = {})
    {
      id: id,
      chromosome: chromosome,
      metadata: {
        data_points: data_points
      }
    }
  end

  def chromosome
  	if self.data_points.any?
  		self.data_points.first.chromosome
  	else
  		nil
  	end
  end

end