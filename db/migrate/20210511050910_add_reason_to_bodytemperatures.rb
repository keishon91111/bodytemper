class AddReasonToBodytemperatures < ActiveRecord::Migration[5.2]
  def change
    add_column :bodytemperatures, :reason, :string
  end
end
