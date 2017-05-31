class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.string :title, null: false
      t.text :teaser
      t.text :description
      t.string :thumbnail_photo
      t.string :cover_photo

      t.timestamps null: false
    end
  end
end
