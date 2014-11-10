class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.belongs_to :image_set, index: true

      t.timestamps null: false
    end
  end
end
