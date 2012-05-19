class CreateClassifications < ActiveRecord::Migration
  def up
  	create_table :classifications do |t|
      t.integer :subject_id
      t.integer :user_id
      t.timestamps
    end
  end

  def down
  	drop_table :classifications
  end
end
