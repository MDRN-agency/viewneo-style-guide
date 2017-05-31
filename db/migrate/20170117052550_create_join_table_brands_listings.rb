class CreateJoinTableBrandsListings < ActiveRecord::Migration[5.0]
  def change
    create_table :brands_listings do |t|
      t.integer :brand_id, null: false, index: true
      t.integer :listing_id, null: false, index: true

      t.index [:brand_id, :listing_id], unique: true
    end
  end
end
