class CreateAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :authorizations do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.integer :user_id, index: true, unique: true

      t.timestamps null: false
    end
    add_index :authorizations, [:user_id, :provider], unique: true
  end
end
