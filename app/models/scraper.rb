require 'open-uri'

class Scraper

  def initialize(gene)
    page = open("https://artsy.net/gene/#{gene}/artworks?")
    @html = Nokogiri::HTML(page)
  end

  def grab_images

  end

end
