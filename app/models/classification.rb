class Classification < ActiveRecord::Base
  
   belongs_to :user
   belongs_to :subject
   has_many :data_points, :through => :subject
   has_many :annotations, :dependent => :destroy 
  
   def self.create_with_result(result)
   #light_curve = result.delete(:light_curves).first
   #annotations = result.delete(:annotations)

   #classification = Classification.new( :light_curve_id => light_curve[:id],
   #                                     :workflow_id => result[:workflow_id],
   #                                     :zooniverse_user_id => result[:zooniverse_user_id],
   #                                     :application_identifier => result[:application_identifier],
   #                                     :session_id => result[:session_id],
   #                                     :started => result[:started],
   #                                     :ended => result[:ended]
   #                                  )
   #                                  
   #transit_count = 0

   #if classification.save

   #  if annotations.empty?

   #    saved = false 
   #    classification.destroy
   #  else

   #    annotations.each do |an| 
   #      answer_id = WorkflowAnswer.find(an[:value]["answer_id"]).answer.id
   #      task_id   = an[:task_id]   

   #      a = Annotation.new(:task_id => task_id, :answer_id => answer_id, :has_extra_data => false, :value => 0)
   #      if an[:value].size > 1
   #        transit_count    = transit_count + 1 
   #        a.x              = an[:value]["x"] if an[:value]["x"]
   #        a.y              = an[:value]["y"] if an[:value]["y"]
   #        a.width          = an[:value]["width"] if an[:value]["width"]
   #        a.height         = an[:value]["height"] if  an[:value]["height"]
   #        a.marker_id      = an[:value]["marker_id"] if an[:value]["marker_id"]
   #        a.add_type       = an[:value]["add_type"] if an[:value]["add_type"]
   #        a.has_extra_data = true 
   #      end
   #      unless classification.annotations << a 
   #        raise "Problem saving Annotation #{a.to_json}"
   #      end
   #    end
   #    classification.update_light_curve_stats transit_count
   #    classification.update_user_stats if result[:zooniverse_user_id]
   #    classification.update_users_redis_store
   #    saved = true
   #  end
   #else
   #  saved = false
   #end
   #saved
   end

   def as_json(opts = {})
    {
      user: user,
      annotations: annotations
    }
  end
  
end