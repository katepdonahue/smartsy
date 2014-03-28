Feature: Guessing Artist's name
  In order to guess the artist's name
  As an internet user
  I want to enter my guess

  Scenario: a user enters a correct guess with correct cases
    Given I am on the game play page
    When I enter a guess "Lucas Cranach the Elder" for the artwork with id "1"
    Then I should get a point

  Scenario: a user enters a correct guess with incorrect cases
    Given I am on the game play page
    When I enter a guess "lucas cranach the elder" for the artwork with id "1"
    Then I should get a point

  Scenario: a user enters an incorrect guess
    Given I am on the game play page
    When I enter a guess "Richard Artschwager" for the artwork with id "1"
    Then I should not get a point
