class UserPhotoUploader < ApplicationUploader
  include CarrierWave::RMagick

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/users/photos/#{model.id}"
  end

  version :sm do
    process resize_to_fill: [100, 100]
  end
end
