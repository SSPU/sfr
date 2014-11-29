class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.text   :password

      t.timestamps
    end

    add_index(:admins, :name, unique: true)

  end
end
