class Annotation < ActiveRecord::Base

  belongs_to :classification
  has_and_belongs_to_many :data_sets

end