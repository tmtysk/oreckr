class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :album
      t.string :name
      t.string :photo, null: false

      t.timestamps
    end
    add_index :photos, :album_id
    add_index :photos, [:album_id, :name], unique: true
  end
end
