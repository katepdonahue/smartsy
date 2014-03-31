class ChangeArtworksYear < ActiveRecord::Migration
  def up
    change_column :artworks, :year, 'integer USING CAST(year AS integer)'
  end
  def down
    change_column :artworks, :year, :string
  end
end
