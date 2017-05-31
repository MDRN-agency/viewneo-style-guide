class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :type, null: false
      t.text :summary
      t.text :description
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country
      t.string :photo
      t.string :website_url
      t.string :phone_number
      t.string :email

      t.timestamps
    end
    add_index :listings, :type
    add_index :listings, :slug, unique: true
  end
end
