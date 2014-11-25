class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :sn
      t.string  :name
      t.text    :des
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
