class RemoveHumanNumberFromBodytemperatures < ActiveRecord::Migration[5.2]
  def change
    remove_column :bodytemperatures, :human_number, :integer
  end
end
