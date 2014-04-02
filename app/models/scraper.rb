require 'httparty'

class Scraper
  attr_reader :gene, :api, :image_cap
    HEADERS = {"Accept" => "application/json", "Accept-Encoding" => "gzip,deflate,sdch", "Accept-Language" => "en-US,en;q=0.8", "Connection" => "keep-alive", "Host" => "api.artsy.net", "If-None-Match" => "d751713988987e9331980363e24189ce", "Origin" => "https://artsy.net", "Referer" => "https://artsy.net/gene/bauhaus/artworks?", "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36", "X-ACCESS-TOKEN" => "JvTPWe4WsQO-xqX6Bts49rvg35XYI_z1qPnG5liSpb-v2bvGchk7ByLFhHQ9IMQRjMhewCFZAfiDC6JeMtjeIIxfzzqTKt3OZlPj6Wqn6HOuC_PAtipiDQTvawfjvkfo_XnfLSdPvAJxnD1f1nhKFXV_LVBsjKE2o5hXVNqN-_7KrduIqXuWbiL5CJHvecCjPEarWDIXW8n3SePozAt72paOrKISQiXGCGCDWdk75L8=", "X-XAPP-TOKEN" => "JvTPWe4WsQO-xqX6Bts49mOwzlhz8QTq95b2v7utRLUYGiLgn_IzhyPnx94Ajw0Ovg-3oC3gXlwJZFLUiI75frJhmsj0QZrjFLH5nAsHnZu-J4DcwU4sLLjDPnC2hx0vRs7THdiYq8q_0kppR3xji9otDHzhkoLwKECdJkSee_EjnS_qJKkcWid435crI_ey"}

  def initialize(gene, image_cap = 32)
    @gene = gene
    @api = "https://api.artsy.net/api/v1/search/filtered/gene/#{gene}?size=10&page="
    @image_cap = image_cap
  end

  def grab_pages
    (1..image_cap).each do |i|
      data = open_page(i.to_s)
      if data[0]
        parse_data(data[0])
      end
    end
  end

  def open_page(num)
    HTTParty.get("#{api}#{num}", :headers => HEADERS)
  end

  def parse_data(data)
    return nil if data == nil || data["artist"] == nil || data["artist"]["name"] == nil
    artist = Artist.find_by(:name => data["artist"]["name"])
    if !artist
      artist = Artist.new
      artist.name = data["artist"]["name"]
    end
    artist.save
    artwork = Artwork.new
    artwork.title = data["title"]
    artwork.year = data["date"].to_i
    artwork.gallery = data["partner"]["name"] if data["partner"]["name"]
    artwork.artist_id = artist.id
    artwork.category = self.gene
    artwork.image_id = data["images"][0]["id"]
    artwork.save
    artwork
  end

  def get_extra_images(img_quant)
    (1..img_quant).each do |i|
      data = self.open_page(i.to_s)
      if data[1]
        self.parse_data(data[1])
      end
    end
  end


end
