class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_fit: [620, 260]
  storage :file
  # storage :fog

  def default_url
    "default_image.png"
  end

  # version :icon_thumb do
  #    process :resize_to_fill => [50, 50]
  # end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
