class RenameItemColumnToBodytemperatures < ActiveRecord::Migration[5.2]
  def change
     rename_column :bodytemperatures, :item, :condition
  end
end
