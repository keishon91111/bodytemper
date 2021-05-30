class RenameReasonColumnToBodytemperatures < ActiveRecord::Migration[5.2]
  def change
     rename_column :bodytemperatures, :reason, :condition
  end
end
