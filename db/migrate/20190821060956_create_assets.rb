class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :path, null: false

      t.timestamps
    end
  end
end
