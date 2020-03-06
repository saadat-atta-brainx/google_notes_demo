class RenameCanEditToAuthority < ActiveRecord::Migration[5.2]
  def change
    rename_column :shares, :can_edit, :authority
  end
end
