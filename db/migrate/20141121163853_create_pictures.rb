class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :product
      t.attachment :file
      t.integer    :order
      t.boolean    :cover, default: false

      t.timestamps
    end
  end
end
