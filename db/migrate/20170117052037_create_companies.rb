class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.text :summary
      t.text :description
      t.string :industry
      t.string :logo
      t.string :thumbnail_photo

      t.timestamps
    end
  end
end
