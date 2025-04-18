



Feature: Displaying search suggestions in the search bar

  As a user
  I want to see relevant suggestions while typing in the search bar
  So that I can quickly select or refine my search query

  Background:
    Given I am on the homepage
    And the search bar is visible in the header

  Rule: Suggestions should appear dynamically based on user input

    

   # Positive paths
    Scenario: Display suggestions when user types a valid query
      When I type "télé" into the search bar
      Then a dropdown with suggestions related to "télé" should appear
      And each suggestion should highlight the nmatching term

    Scenario: Click on a suggestion to search directly
      When I type "aspirateur" into the search bar
      And I click on the suggestion "aspirateur sans sac"
      Then I should be redirected to the search results page for "aspirateur sans sac"

    Scenario: Navigate suggestions using keyboard arrows
      When I type "chaussures" into the search bar
      And I use the down arrow key to navigate the suggestions
      And I press "Enter" 
      Then I should be redirected to the search results page for the selected suggestion

    Scenario: No suggestions found 
      When I type a random string like "xyzabc123" into the search bar
      Then the suggestion dropdown should display "Aucune suggestion trouvée"

    Scenario: Suggestions disappear when input is cleared
      When I type "ordinateur" into the search bar
      And I clear the input field
      Then the suggestion dropdown should disappear

  Rule: Input behavior and performance

    Scenario: Suggestions appear only after minimum characters typed
      When I type "t" into the search bar
      Then no suggestions should appear
      When I type a second character to form "tv"
      Then suggestions related to "tv" should appear

    # Negative paths

    Scenario: Suggestions fail to load due to server error
      Given the suggestion service is down
      When I type "frigo" into the search bar
      Then an error message "Suggestions non disponibles pour le moment" should appear
      And the suggestion dropdown should not open

    Scenario: JavaScript disabled - no suggestions
      Given JavaScript is disabled in my browser
      When I type "four" into the search bar
      Then no suggestion dropdown should appear
