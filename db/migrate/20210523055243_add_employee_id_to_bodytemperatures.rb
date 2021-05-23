class AddEmployeeIdToBodytemperatures < ActiveRecord::Migration[5.2]
  def change
      add_reference  :bodytemperatures, :employee, foreign_key: true
  end
end
