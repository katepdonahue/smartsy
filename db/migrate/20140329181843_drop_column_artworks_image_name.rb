class DropColumnArtworksImageName < ActiveRecord::Migration
  def up
    remove_column :artworks, :image_name
  end
  def down
    remove_column :artworks, :image_name, :string
  end
end
