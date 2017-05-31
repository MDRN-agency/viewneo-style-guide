# == Schema Information
#
# Table name: companies
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  summary         :text
#  description     :text
#  industry        :string
#  logo            :string
#  thumbnail_photo :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Company < ApplicationRecord
  mount_uploader :logo, CompanyLogoUploader
  mount_uploader :thumbnail_photo, CompanyThumbnailPhotoUploader

  has_and_belongs_to_many :listings
  has_and_belongs_to_many :deals

  validates :name,
            presence: true,
            length: { minimum: 2, maximum: 200 }
end
