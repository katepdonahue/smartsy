Feature: Game setup
  In order to play the game with a specific gene
  As an internet user
  I want to see the corresponding photos from the database

  Scenario: On a specific genre game page
    Given I am on the game page
    Then the game play page should show the images
    And the game play page should show the images' titles
    And the game play page should not show the artists' names
