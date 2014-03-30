Feature: Guessing Artist's name
  In order to guess the artist's name
  As an internet user
  I want to enter my guess

  Scenario: a user enters a correct guess with correct cases
    Given I am on the "bauhaus" game play page
    When I enter a guess "Josef Albers" for the artwork with id "1"
    And I enter a guess "Hördur Ágústsson" for the artwork with id "2"
    Then I should get "2" points

  Scenario: a user enters a correct guess with incorrect cases
    Given I am on the "bauhaus" game play page
    When I enter a guess "josef albers" for the artwork with id "1"
    Then I should get "1" point

  Scenario: a user enters a correct guess with incorrect accents
    Given I am on the "bauhaus" game play page
    When I enter a guess "Hordur Águstsson" for the artwork with id "1"
    Then I should get "1" point

  Scenario: a user enters an incorrect guess
    Given I am on the "bauhaus" game play page
    When I enter a guess "Richard Artschwager" for the artwork with id "1"
    Then I should get "0" points
