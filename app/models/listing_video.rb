# == Schema Information
#
# Table name: listing_videos
#
#  id         :integer          not null, primary key
#  listing_id :integer
#  caption    :string
#  url        :string           not null
#

class ListingVideo < ApplicationRecord
  belongs_to :listing, inverse_of: :videos

  validates :url, url: true
end
