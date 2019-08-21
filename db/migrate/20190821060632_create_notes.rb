class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :description
      t.integer :status
      t.integer :is_pinned
      t.integer :is_archive
      t.string :background_color

      t.timestamps
    end
  end
end
