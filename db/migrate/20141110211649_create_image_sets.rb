class CreateImageSets < ActiveRecord::Migration
  def change
    create_table :image_sets do |t|
      t.string :question
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
