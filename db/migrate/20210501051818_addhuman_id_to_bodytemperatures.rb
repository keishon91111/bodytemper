class AddhumanIdToBodytemperatures < ActiveRecord::Migration[5.2]
  def change
      add_reference :bodytemperatures, :human, foreign_key: true
  end
end
