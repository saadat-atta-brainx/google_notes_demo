class ChangeCanEditColumnFromBooleanToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :shares, :can_edit, :integer, default: 0, null: false
  end
end
