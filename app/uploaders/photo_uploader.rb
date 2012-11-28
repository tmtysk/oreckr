# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  #storage :file
  storage :fog

  def store_dir
    "#{model.album.id}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  version :thumb do
    process :resize_to_fill => [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg)
  end


end
