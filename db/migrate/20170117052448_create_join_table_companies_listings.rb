class CreateJoinTableCompaniesListings < ActiveRecord::Migration[5.0]
  def change
    create_table :companies_listings do |t|
      t.integer :company_id, null: false, index: true
      t.integer :listing_id, null: false, index: true

      t.index [:company_id, :listing_id], unique: true
    end
  end
end
