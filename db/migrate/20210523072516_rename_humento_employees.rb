class RenameHumentoEmployees < ActiveRecord::Migration[5.2]
  def change
     rename_table :humen, :employees
  end
end
