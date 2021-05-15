class AddItemToBodytemperatures < ActiveRecord::Migration[5.2]
  def change
    add_column :bodytemperatures, :item, :string
  end
end
