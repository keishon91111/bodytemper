class RenameConditionColumnToBodytemperatures < ActiveRecord::Migration[5.2]
  def change
  rename_column :bodytemperatures, :condition, :reason
  end
end
