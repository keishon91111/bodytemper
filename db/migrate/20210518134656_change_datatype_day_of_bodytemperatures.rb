class ChangeDatatypeDayOfBodytemperatures < ActiveRecord::Migration[5.2]
  def change
     change_column :bodytemperatures, :day, :date
  end
end
