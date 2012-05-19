class AddHasManyTables < ActiveRecord::Migration
  def up
  	remove_column :subjects, :start_point
  	remove_column :subjects, :end_point

  	create_table :subjects_data_sets do |t|
  		t.references :subject
  		t.references :data_set
  	end

  	create_table :annotations_data_sets do |t|
  		t.references :annotation
  		t.references :data_set
  	end
  end

  def down
  	drop_table :subjects_data_sets
  	drop_table :annotations_data_sets
  end
end
