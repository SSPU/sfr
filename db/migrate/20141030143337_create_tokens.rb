class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.belongs_to :user
      t.text       :token
      t.datetime   :expire

      t.timestamps
    end

    add_index(:tokens, :user_id, unique: true)

  end
end
