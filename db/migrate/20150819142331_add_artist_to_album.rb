class AddArtistToAlbum < ActiveRecord::Migration
  def change
    change_table :albums do |t|
      t.belongs_to :artist
    end
  end
end
