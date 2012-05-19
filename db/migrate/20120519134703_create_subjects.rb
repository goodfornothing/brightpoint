class CreateSubjects < ActiveRecord::Migration
  def up
  	create_table :subjects do |t|
      t.string :chromosome
      t.integer :start_point, :limit => 8
      t.integer :end_point, :limit => 8
      t.timestamps
    end
  end

  def down
  	drop_table :subjects
  end
end
