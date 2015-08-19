class AddRecordLabelToAlbum < ActiveRecord::Migration
  def change
    change_table :albums do |t|
      t.belongs_to :record_label
    end
  end
end
