class AddHumanNumberToOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :offices, :human_number, :integer
  end
end
