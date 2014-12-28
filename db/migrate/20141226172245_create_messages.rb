class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :tel
      t.text   :text

      t.timestamps
    end
  end
end
