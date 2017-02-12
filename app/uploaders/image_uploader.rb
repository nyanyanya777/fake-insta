class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


   def extension_white_list
     %w(jpg jpeg gif png)
   end

   def filename
     super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
   end

end
