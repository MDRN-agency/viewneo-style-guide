class CreateListingVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_videos do |t|
      t.integer :listing_id
      t.string :caption
      t.string :url, null: false
    end
    add_index :listing_videos, :listing_id
  end
end
