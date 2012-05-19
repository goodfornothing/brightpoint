class RenameAssociationTables < ActiveRecord::Migration
  def up
  	rename_table :subjects_data_sets, :data_sets_subjects
  	rename_table :annotations_data_sets, :data_sets_annotations
  end

  def down
  	rename_table :data_sets_subjects, :subjects_data_sets
  	rename_table :data_sets_annotations, :annotations_data_sets
  end
end
