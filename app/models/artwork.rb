class Artwork < ActiveRecord::Base
  belongs_to :artist
  # attr_accessor :image_id

  def self.clean_imgs(gene)
    self.where(:category => gene).each do |art_obj|
      if art_obj.class == Artwork
        response = HTTParty.get("https://d1ycxz9plii3tb.cloudfront.net/additional_images/#{art_obj.image_id}/tall.jpg")
        i = 0
        while response["Error"] || i > 5
          i += 1
          response = HTTParty.get("https://d1ycxz9plii3tb.cloudfront.net/additional_images/#{art_obj.image_id}/#{i}/tall.jpg")
        end
        art_obj.image_id = "#{image_id}/#{i}" if i > 0
        art_obj.save
      end
    end
  end

  def clean_img(gene)
    response = HTTParty.get("https://d1ycxz9plii3tb.cloudfront.net/additional_images/#{art_obj.image_id}/tall.jpg")
    i = 0
    while response["Error"] || i > 5
      i += 1
      response = HTTParty.get("https://d1ycxz9plii3tb.cloudfront.net/additional_images/#{art_obj.image_id}/#{i}/tall.jpg")
    end
    art_obj.image_id = "#{image_id}/#{i}" if i > 0
    art_obj.save
  end

end