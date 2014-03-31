require 'spec_helper'

describe Scraper do

  describe "#grab_pages" do
    bauhaus_scraper = Scraper.new("bauhaus")
    bauhaus_scraper.grab_pages
    it "should grab all the photos and save them in the database" do
      expect(Artwork.find_by(:title => "Study for Homage to the square: Absorption")).not_to be_nil
    end
    it "should not create duplicate artists in the database" do
      expect(Artist.where(:name => "Josef Albers").length).to eq(1)
    end
  end

  describe "#open_page" do
    it "should open the correct page of the api and return the response" do
      bauhaus_scraper = Scraper.new("bauhaus")
      expect(bauhaus_scraper.open_page(1)[0]["error"]).to be_nil
    end
  end

  describe "#parse_data" do
    bauhaus_scraper = Scraper.new("bauhaus")
    data = bauhaus_scraper.open_page("1")
    artwork = bauhaus_scraper.parse_data(data)
    it "should save the correct artist_id for the artwork object" do
      expect(artwork.artist_id).to eq(1)
    end
    it "should save the correct title for the artwork object" do
      expect(artwork.title).to eq("Study for Homage to the square: Absorption")
    end
    it "should save the correct year for the artwork object" do
      expect(artwork.year).to eq(1967)
    end
    it "should save the correct gallery for the artwork object" do
      expect(artwork.gallery).to eq("Vedovi Gallery")
    end
    it "should save the correct category for the artwork object" do
      expect(artwork.category).to eq("bauhaus")
    end
    it "should save the correct image_id for the artwork object" do
      expect(artwork.image_id).to eq("5331ae928b3b81a6b5000009")
    end
  end

  describe "#fix_img_id" do
    it "should add a /index to the image_id" do
      broken = Artwork.new(:image_id => "515cfbb75eeb1c524c001c29")
      Scraper.new("bauhaus").fix_img_id(broken, 3)
      expect(broken.image_id).to eq("515cfbb75eeb1c524c001c29/3")
    end
  end

  describe "#check_img" do
    it "should figure out if the image is broken and find the working index" do
      broken = Artwork.new(:title => "broken", :image_id => "515cfbb75eeb1c524c001c29")
      Scraper.new("bauhaus").check_img(broken)
      expect(broken.image_id).to eq("515cfbb75eeb1c524c001c29/2")
    end
  end

end