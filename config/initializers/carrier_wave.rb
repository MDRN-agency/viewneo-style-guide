case (ENV['STORAGE_DRIVER'] || 'local')
  when 'S3'
    CarrierWave.configure do |config|
      config.fog_provider = 'fog/aws'
      config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
        aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
        region:                ENV.fetch('AWS_REGION')
      }
      config.fog_directory  = ENV.fetch('S3_BUCKET_NAME')
      config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
      config.storage = :fog
    end
  when 'local'
    CarrierWave.configure do |config|
      config.storage = :file
    end
  else
  fail "'#{driver}'' driver for file storage is invalid. Available drivers: 'S3', 'local'"
end
