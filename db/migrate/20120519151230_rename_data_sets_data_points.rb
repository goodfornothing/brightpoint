class RenameDataSetsDataPoints < ActiveRecord::Migration
  def up
  	
  	rename_table :data_sets, :data_points
  	rename_table :annotations_data_sets, :annotations_data_points
  	rename_table :data_sets_subjects, :data_points_subjects

  	rename_column :data_points_subjects, :data_set_id, :data_point_id
  	rename_column :annotations_data_points, :data_set_id, :data_point_id

  end

  def down

  	rename_table :data_points, :data_sets
  	rename_table :annotations_data_points, :annotations_data_sets
  	rename_table :data_points_subjects, :data_sets_subjects

  	rename_column :data_points_subjects, :data_point_id, :data_set_id
  	rename_column :annotations_data_points, :data_point_id, :data_set_id

  end
end
