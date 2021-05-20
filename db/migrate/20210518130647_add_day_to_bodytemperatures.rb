class AddDayToBodytemperatures < ActiveRecord::Migration[5.2]
  def change
    add_column :bodytemperatures, :day, :integer
  end
end
