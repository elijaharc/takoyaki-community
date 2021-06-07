require "fog/aws"

CarrierWave.configure do |config|
    config.storage = Fog
    config.fog_public = true
    config.fog_directory = ENV["S3_BUCKET"]
    config.delete_tmp_file_after_storage = false

    config.fog_credentials = {
        region: ENV["S3_REGION"],
        provider: "AWS",
        aws_access_key_id: ENV["S3_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["S3_SECRET_ACCESS_KEY"]
    }
end

if Rails.env.test?
  CarrierWave::Uploader::Base.enable_processing = false
end
