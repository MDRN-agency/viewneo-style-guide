class CreateJoinTablesForDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :companies_deals do |t|
      t.integer :company_id, null: false, index: true
      t.integer :deal_id, null: false, index: true

      t.index [:company_id, :deal_id], unique: true
    end

    create_table :brands_deals do |t|
      t.integer :brand_id, null: false, index: true
      t.integer :deal_id, null: false, index: true

      t.index [:brand_id, :deal_id], unique: true
    end
  end
end
