class RemoveHumanIdFromBodytemperatures < ActiveRecord::Migration[5.2]
  def change
    remove_column :bodytemperatures, :human_id, :integer
  end
end
