# == Schema Information
#
# Table name: deals
#
#  id              :integer          not null, primary key
#  title           :string           not null
#  teaser          :text
#  description     :text
#  thumbnail_photo :string
#  cover_photo     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Deal < ApplicationRecord
  mount_uploader :thumbnail_photo, DealThumbnailPhotoUploader
  mount_uploader :cover_photo, DealCoverPhotoUploader

  has_many :options, class_name: DealOption, dependent: :destroy, inverse_of: :deal
  accepts_nested_attributes_for :options, allow_destroy: true

  has_and_belongs_to_many :brands
  has_and_belongs_to_many :companies

  validates :title,
            presence: true,
            length: { maximum: 200 }
end
