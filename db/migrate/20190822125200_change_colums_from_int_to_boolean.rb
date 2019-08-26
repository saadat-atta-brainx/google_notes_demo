class ChangeColumsFromIntToBoolean < ActiveRecord::Migration[5.2]
  def change

    change_column :notes, :is_pinned, :boolean, null: false, default: false
    change_column :notes, :is_archive, :boolean, null: false, default: false
    change_column :notes, :status, :boolean, null: false, default: true

  end
end
