class ChangeOfficesToBodyTemperatures < ActiveRecord::Migration[5.2]
  def change
    rename_table :offices, :bodytemperatures
  end
  
end
