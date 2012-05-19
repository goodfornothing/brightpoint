class CreateDataSets < ActiveRecord::Migration
  def change
    create_table :data_sets do |t|
      t.string :chromosome
      t.integer :start_point, :limit => 8
      t.integer :end_point, :limit => 8
      t.integer :y_point, :limit => 8
      t.string :probe
      t.timestamps
    end
    
    add_index :data_sets, :start_point
    add_index :data_sets, :end_point
    add_index :data_sets, :y_point
    add_index :data_sets, :probe
    add_index :data_sets, :chromosome
  end
end