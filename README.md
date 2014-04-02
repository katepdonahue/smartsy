# Smartsy

You can find the deployed app <a href="http://smartsy.herokuapp.com/">here</a>.

Here's the home page:

<img src="/public/smartsy_home.png" alt="Drawing" style="width: 200px;"/>

First choose a genre.

Here's the Bauhaus page. 

<img src="/public/smartsy_play.png" alt="Drawing" style="width: 200px;"/>

Next fill in the empty Artist fields and submit the results.

Here's the Post War American Art page after submitting results

<img src="/public/smartsy_results.png" alt="Drawing" style="width: 200px;"/>


Smartsy is a game which displays artworks with their titles and allows users to guess the artist. 

It's written in Ruby 2.0.0p247 and Rails 4.0.2.

## Installation

To get it running locally and play around with the code yourself:

Clone the repo

```ruby
git clone "https://github.com/katepdonahue/smartsy.git"
```

Bundle the Gemfile

```ruby
bundle install
```

Run the migrations

```ruby
rake db:migrate
```

Run the seeds
```ruby
rake db:seed
```

The seeds could take awhile because data is being grabbed somewhat illegally from Artsy's api.

## Setup

I found that there were a few missing images for some of the genres because either the hits to the api went beyond the number of pages available for the genre, or an image was missing on the site. To grab extra images for a genre check the seeds file for the correctly formatted genre name, and run the following:

```ruby
rails c

  >> my_scraper = Scraper.new("genre-name")
  >> my_scraper.get_extra_images(number_of_images_you_want)

```

For example:

```ruby
rails c

  >> my_scraper = Scraper.new("bauhaus")
  >> my_scraper.get_extra_images(6)

```
This would add data for 6 more Artwork objects with the genre "bauhaus" to the database.



## Testing

You can run the test suite by running:

```ruby
rake spec
```

Currently there are unit tests for the scraper and pending cucumber tests. I plan on writing unit tests for the artwork and game classes as well as completing the cucumber tests in the future.