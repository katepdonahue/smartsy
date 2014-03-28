class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :image_name
      t.string :title
      t.string :year
      t.string :gallery
      t.integer :artist_id
    end
  end
end
