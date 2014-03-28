Feature: Looking at artworks
  In order to play the game
  As an internet user
  I want to see a random selection of photos from the database

  Scenario: I go to the game play page
    Given there are photos in the database
    When I go to the game play page
    Then the game play page should show the art images
    And the game play page should show the images' titles
    And the game play page should not show the artists' names
