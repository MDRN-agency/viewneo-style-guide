# == Schema Information
#
# Table name: listings
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  slug            :string           not null
#  type            :string           not null
#  summary         :text
#  description     :text
#  street_address  :string
#  city            :string
#  state           :string
#  country         :string
#  website_url     :string
#  phone_number    :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  logo            :string
#  cover_photo     :string
#  thumbnail_photo :string
#

class Listing < ApplicationRecord
  self.inheritance_column = nil

  TYPES = [
    'Business',
    'Property',
    'People',
    'Groups',
    'Jobs and Ads'
  ]

  mount_uploader :logo, ListingLogoUploader
  mount_uploader :thumbnail_photo, ListingThumbnailPhotoUploader
  mount_uploader :cover_photo, ListingCoverPhotoUploader

  has_many :photos,
           class_name: ListingPhoto,
           inverse_of: :listing,
           dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many :videos,
           class_name: ListingVideo,
           inverse_of: :listing,
           dependent: :destroy
  accepts_nested_attributes_for :videos, allow_destroy: true

  has_and_belongs_to_many :companies
  has_and_belongs_to_many :brands

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 2, maximum: 200 }
  validates :type, presence: true, inclusion: { in: TYPES }

  validates :website_url,
            url: true,
            allow_nil: true,
            allow_blank: true

  before_save :generate_slug, if: :name_changed?

  def full_address
    [street_address, city, state, country].compact.join(', ').strip
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
