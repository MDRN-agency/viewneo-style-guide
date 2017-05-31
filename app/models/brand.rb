# == Schema Information
#
# Table name: brands
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  summary         :text
#  description     :text
#  industry        :string
#  logo            :string
#  thumbnail_photo :string
#

class Brand < ApplicationRecord
  mount_uploader :logo, BrandLogoUploader
  mount_uploader :thumbnail_photo, BrandThumbnailPhotoUploader

  has_and_belongs_to_many :listings
  has_and_belongs_to_many :deals

  validates :name,
            presence: true,
            length: { minimum: 2, maximum: 100 }
end
