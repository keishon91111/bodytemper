class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.date :day
      t.float :temper

      t.timestamps
    end
  end
end
