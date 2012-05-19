class CreateAnnotations < ActiveRecord::Migration
  def up
  	create_table :annotations do |t|
      t.integer :classification_id
      t.timestamps
    end
  end

  def down
  	drop_table :annotations
  end
end
