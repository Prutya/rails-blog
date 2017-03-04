class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process resize_to_fill: [400, 400, :north]

  version :thumb do
    process resize_to_fill: [64, 64, :north]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    return SecureRandom.hex unless file.nil?
  end

  def default_url
    "fallback/" + [version_name, 'user.png'].compact.join('_')
  end
end
