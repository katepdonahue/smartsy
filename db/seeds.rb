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

