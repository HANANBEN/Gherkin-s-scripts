



Feature: Triggering search results by pressing the Enter key

  As a user
  I want to press the "Enter" key after typing in the search bar
  So that I can directly view the relevant search results

  Background:
    Given I am on the homepage
    And the search bar is visible

  # positive Path
  Scenario: Display search results when pressing Enter with a valid query
    When I type "laptop" into the search bar
    And I press the "Enter" key
    Then I should be redirected to the search results page
    And I should see product results related to "laptop"

  # edge Case - Empty query
  Scenario: Press Enter with an empty search bar
    When I focus on the search bar
    And I press the "Enter" key without typing anything
    Then I should see my recent search history displayed below the search bar
    And no search action should be triggered
    And I should remain on the current page

  #negative Path - Search unavailable (e.g. backend issue)
  Scenario: Press Enter when the search service is unavailable
    When I type "table" into the search bar
    And the search service is currently down
    And I press the "Enter" key
    Then I should see an error message like "La recherche est temporairement indisponible"
    And I should not be redirected

  #maintain search term on redirect
  Scenario: Keep search term visible after redirection
    When I type "chaussures" into the search bar
    And I press the "Enter" key
    Then I should be redirected to the search results page
    And the search input should still contain "chaussures"
