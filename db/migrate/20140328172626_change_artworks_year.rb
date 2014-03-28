class ChangeArtworksYear < ActiveRecord::Migration
  def up
    change_column :artworks, :year, :integer
  end
  def down
    change_column :artworks, :year, :string
  end
end
