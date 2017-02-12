class AddImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image, :image_tag
  end
end
