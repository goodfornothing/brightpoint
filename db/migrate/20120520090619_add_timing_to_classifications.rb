class AddTimingToClassifications < ActiveRecord::Migration
  def change
  	add_column :classifications, :started, :timestamp
  	add_column :classifications, :ended, :timestamp
  end
end
