class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.text :summary
      t.text :description
      t.string :industry
      t.string :logo
      t.string :thumbnail_photo
    end
  end
end
