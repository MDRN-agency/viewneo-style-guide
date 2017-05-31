class CreateListingPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_photos do |t|
      t.integer :listing_id, null: false
      t.string :caption
      t.string :image, null: false
    end
    add_index :listing_photos, :listing_id
  end
end
