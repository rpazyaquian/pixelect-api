class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.belongs_to :image_set, index: true
      t.belongs_to :comment, index: true

      t.timestamps null: false
    end
  end
end
