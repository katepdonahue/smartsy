class AddColumnArtworksImageId < ActiveRecord::Migration
  def change
    add_column :artworks, :image_id, :string
  end
end
