class AddColumnArtworksCategory < ActiveRecord::Migration
  def change
    add_column :artworks, :category, :string
  end
end
