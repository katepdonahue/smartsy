class Artwork < ActiveRecord::Base
  belongs_to :artist
  # attr_accessor :image_id

  def self.clean_imgs(gene)
    self.where(:category => gene).each do |art_obj|
      response = HTTParty.get("https://d1ycxz9plii3tb.cloudfront.net/additional_images/#{art_obj.image_id}/tall.jpg")
      i = 0
      while response["Error"] && i < 6
        i += 1
        response = HTTParty.get("https://d1ycxz9plii3tb.cloudfront.net/additional_images/#{art_obj.image_id}/#{i}/tall.jpg")
      end
      art_obj.image_id = "#{art_obj.image_id}/#{i}" if i > 0
      art_obj.save
    end
  end

  def clean_img
    response = HTTParty.get("https://d1ycxz9plii3tb.cloudfront.net/additional_images/#{self.image_id}/tall.jpg")
    i = 0
    while response["Error"] || i > 5
      i += 1
      response = HTTParty.get("https://d1ycxz9plii3tb.cloudfront.net/additional_images/#{self.image_id}/#{i}/tall.jpg")
    end
    self.image_id = "#{self.image_id}/#{i}" if i > 0
    self.save
  end

end