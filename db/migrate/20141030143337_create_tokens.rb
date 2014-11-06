class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.belongs_to :user
      t.string     :token
      t.datetime   :expire

      t.timestamps
    end

    add_index(:tokens, :user_id, unique: true)
    add_index(:tokens, :token,   unique: true)

  end
end
