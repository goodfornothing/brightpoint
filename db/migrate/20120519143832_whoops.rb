class Whoops < ActiveRecord::Migration
  def up
  	rename_table :data_sets_annotations, :annotations_data_sets
  end

  def down
  	rename_table :annotations_data_sets, :data_sets_annotations
  end
end
