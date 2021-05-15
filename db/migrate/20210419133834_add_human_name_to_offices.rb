class AddHumanNameToOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :offices, :human_name, :string
  end
end
