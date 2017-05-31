class AddAdditionalFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :location
      t.string :industry
      t.string :phone
      t.string :description

      t.string :linkedin_url
      t.string :twitter_url
      t.string :facebook_url
      t.string :google_plus_url
    end
  end
end
