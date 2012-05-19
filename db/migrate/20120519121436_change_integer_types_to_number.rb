class ChangeIntegerTypesToNumber < ActiveRecord::Migration
  def up
    change_column :data_sets, :y_point, :decimal
  end

  def down
  end
end