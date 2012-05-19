class Subject < ActiveRecord::Base
  
	has_many :classifications
	has_and_belongs_to_many :data_sets
	
end