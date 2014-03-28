require 'spec-helper'

describe Scraper do

  describe "#grab_images" do
    it "should grab all the photos and save them in the database" do
      bauhaus_scraper = Scraper.new("bauhaus")
      bauhaus_scraper.grab_images
      expect(Artwork.find_by_name("Gasse").length).to eq(1)
    end
  end



end