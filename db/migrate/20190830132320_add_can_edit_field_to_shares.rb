class AddCanEditFieldToShares < ActiveRecord::Migration[5.2]
  def change
    add_column :shares, :can_edit, :boolean, default: false, null: false
  end
end
