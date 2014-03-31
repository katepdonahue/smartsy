# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Scraper.new("bauhaus").grab_pages
Scraper.new("art-nouveau").grab_pages
Scraper.new("post-war-american-art").grab_pages
Scraper.new("post-war-european-art").grab_pages
Scraper.new("renaissance").grab_pages
# Scraper.new("arts-of-africa-oceania-and-the-americas").grab_pages # figure out why this one doesn't work later
Scraper.new("minimalism").grab_pages
Scraper.new("impressionism").grab_pages

Artwork.clean_imgs("bauhaus")
Artwork.clean_imgs("art-nouveau")
Artwork.clean_imgs("post-war-american-art")
Artwork.clean_imgs("post-war-european-art")
Artwork.clean_imgs("renaissance")
Artwork.clean_imgs("minimalism")
Artwork.clean_imgs("impressionism")

broken1 = Artwork.find_by(:image_id => "515bad5094714c2e380010ea/6")
broken1.image_id = "516ded24b31e2bd65e0007ee"
broken1.save
broken2 = Artwork.find_by(:image_id => "515b122c9562c86fb8000818/6")
broken2.delete

