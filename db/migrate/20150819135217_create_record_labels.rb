class CreateRecordLabels < ActiveRecord::Migration
  def change
    create_table :record_labels do |t|
      t.string :label
      
      t.timestamps null: false
    end
  end
end
