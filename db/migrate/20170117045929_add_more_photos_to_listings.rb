class AddMorePhotosToListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :photo, :string
    change_table :listings do |t|
      t.string :logo
      t.string :cover_photo
      t.string :thumbnail_photo
    end
  end
end
