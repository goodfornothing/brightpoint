class RemoveChromosomeFromSubject < ActiveRecord::Migration
  def up
  	remove_column :subjects, :chromosome
  end

  def down
  	add_column :subjects, :chromosome
  end
end
