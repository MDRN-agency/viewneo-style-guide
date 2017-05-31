class BrandThumbnailPhotoUploader < ApplicationUploader
  include CarrierWave::RMagick

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/brands/#{model.id}/thumbnail_photo"
  end
end
