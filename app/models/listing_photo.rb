# == Schema Information
#
# Table name: listing_photos
#
#  id         :integer          not null, primary key
#  listing_id :integer          not null
#  caption    :string
#  image      :string           not null
#

class ListingPhoto < ApplicationRecord
  mount_uploader :image, ListingPhotoUploader

  belongs_to :listing, inverse_of: :photos

  validates_presence_of :image
end
