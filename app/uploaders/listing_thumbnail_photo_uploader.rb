class ListingThumbnailPhotoUploader < ApplicationUploader
  include CarrierWave::RMagick

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/listings/#{model.id}/thumbnail_photo"
  end
end
