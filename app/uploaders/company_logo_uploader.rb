class CompanyLogoUploader < ApplicationUploader
  include CarrierWave::RMagick

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/companies/#{model.id}/logo"
  end
end
