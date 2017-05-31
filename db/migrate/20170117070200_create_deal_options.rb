class CreateDealOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :deal_options do |t|
      t.integer :deal_id, null: false, index: true
      t.string :title, null: false
      t.text :details
      t.float :original_price
      t.float :deal_price

      t.timestamps null: false
    end
  end
end
