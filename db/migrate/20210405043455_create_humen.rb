class CreateHumen < ActiveRecord::Migration[5.2]
  def change
    create_table :humen do |t|
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
