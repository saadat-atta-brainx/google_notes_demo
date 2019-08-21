class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.string :description
      t.integer :status, null: false, default: 1
      t.integer :is_pinned, null: false, default: 0
      t.integer :is_archive, null: false, default: 0
      t.string :background_color, null: false, default: '#ffffff'

      t.timestamps
    end
  end
end
