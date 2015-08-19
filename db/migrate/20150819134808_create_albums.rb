class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album
      t.integer :edition
      t.boolean :crown
      t.boolean :core
      t.boolean :best_1001
      
      t.timestamps null: false
    end
  end
end
