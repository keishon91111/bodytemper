class RemoveHumanNameFromBodytemperatures < ActiveRecord::Migration[5.2]
  def change
    remove_column :bodytemperatures, :human_name, :string
  end
end
