class RemoveDayFromBodytemperatures < ActiveRecord::Migration[5.2]
  def change
    remove_column :bodytemperatures, :day, :integer
  end
end
