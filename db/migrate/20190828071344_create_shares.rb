class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.references :note, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :shares, [:user_id,:note_id], unique: true
  end
end
