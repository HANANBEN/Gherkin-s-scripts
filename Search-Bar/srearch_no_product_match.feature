



Feature: No search results handling

  Background:
    Given I am on the homepage
    And the search bar is visible

  #positive Path - No matching results but graceful handling

  Scenario: Display 'no products found' message when search returns nothing
    When I type "laptoprbkr" in the search bar
    And I press the "Enter" key
    Then I should be redirected to the search results page
    And I should see a message like:
      """
      Malheureusement, nous ne trouvons aucun produit correspondant à 
     "laptoprbkr". Essayez à nouveau en 
      vérifiant l'orthographe ou en faisant une recherche plus courte.
      """

  # suggest a retry path

  Scenario: Display retry options after no result
    Given I have searched for a term with no result
    When I view the "Essayez à nouveau" section
    Then I should see a visible "Rechercher" button
    And I should be able to retry the search

  # edge Case - Input with only whitespace
  Scenario: Submit a search with only spaces
    When I type "     " in the search bar
    And I press the "Enter" key
    Then I should remain on the same page
    And no search should be performed
    And I should see recent search history or search suggestions

  # negative Path - Backend/API fails
  Scenario: Server error during search request
    When I type "ordinateur" in the search bar
    And a server error occurs while fetching results
    Then I should see an error message like "Une erreur est survenue. Veuillez réessayer plus tard"
    And I should remain on the same page

  # retry scenario
  Scenario: User retries with a shorter query after failure
    Given I previously searched "laptoprbkrjjrjrjrjrjrjjr ytytytesshhf" and saw no result
    When I replace it with "laptop" and press "Enter"
    Then I should be redirected to the search results page
    And I should see a list of products related to "laptop"
