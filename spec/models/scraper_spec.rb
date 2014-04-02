require 'spec_helper'

describe Scraper do

  describe "#grab_pages" do
    bauhaus_scraper = Scraper.new("bauhaus")
    bauhaus_scraper.grab_pages
    it "should grab all the photos and save them in the database" do
      expect(Artwork.where(:category => "bauhaus").length).to be > 0
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
    artwork = bauhaus_scraper.parse_data(data[0])
    it "should save the artist_id for the artwork object" do
      expect(Artwork.find(1).artist_id).to eq(1)
    end
  end

  describe "#clean_img" do
    it "should figure out if the image is broken and find the working index" do
      broken = Artwork.new(:image_id => "515cfbb75eeb1c524c001c29")
      broken.clean_img
      expect(broken.image_id).to eq("515cfbb75eeb1c524c001c29/2")
    end
  end

  describe "#get_extra_images" do
    it "should grab the given number of artwork objects and add them to the database" do
      bau = Scraper.new("bauhaus")
      bau.grab_pages
      bau_num1 = Artwork.where(:category => "bauhaus").length
      bau.get_extra_images(6)
      bau_num2 = Artwork.where(:category => "bauhaus").length
      expect(bau_num2 - bau_num1).to eq(6)
    end
  end

end