require 'spec_helper'

describe Scraper do

  describe "#grab_pages" do
    it "should grab all the photos and save them in the database" do
      bauhaus_scraper = Scraper.new("bauhaus")
      bauhaus_scraper.grab_pages
      expect(Artwork.find_by(:title => "Study for Homage to the square: Absorption")).not_to be_nil
    end
  end

  describe "#open_page" do
    it "should open the correct page of the api and return the response" do
      bauhaus_scraper = Scraper.new("bauhaus")
      expect(bauhaus_scraper.open_page(1)[0]["error"]).to be_nil
    end
  end

  describe "#parse_data" do
    it "should save the correct data to an artist and artwork object" do
      bauhaus_scraper = Scraper.new("bauhaus")
      data = bauhaus_scraper.open_page("1")
      expect(bauhaus_scraper.parse_data(data)).to eq(Artwork.find(1))
    end
  end

end