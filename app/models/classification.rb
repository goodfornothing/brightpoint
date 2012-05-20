class Classification < ActiveRecord::Base
  
  attr_accessible :started, :ended, :data_points

  belongs_to :user
  belongs_to :subject
  has_many :data_points, :through => :subject
  has_many :annotations, :dependent => :destroy 
 
  def as_json(opts = {})
    {
      subject_ids: [subject.id],
      annotations: annotations
    }
  end
  
end