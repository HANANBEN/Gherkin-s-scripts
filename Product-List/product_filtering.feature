
Feature: Live refresh of product list and filters after each filter selection

  As a user
  I want the product list and available filters to update after each filter I select
  So that I always see relevant results and filter options

  Background:
    Given I already listed a specific product category 
    And chosed a specific subcategory
    And I am on the product list page of that subcategory
    And I see the filters displayed on the page and the list is ready to be filtered 

 # Filter step-by-step with individual refresh after each selection
Scenario: Filter products by selecting criteria with dynamic refresh
  When I check "<filterCategory>" with value "<filterValue>"
  Then the product list should refresh
  And only products matching "<filterValue>" in "<filterCategory>" should be displayed
  And the available filters should be updated based on current results

# Edge Case: Filters leading to zero results are not displayed
Scenario: Only relevant filters are shown based on available products
  Given the current list of products is displayed
  When I apply a filter "<filterCategory>" with value "<filterValue>"
  Then the product list should refresh
  And only products matching "<filterValue>" should be shown
  And the available filters should be updated accordingly
  And filters that would lead to zero results should not be displayed
   


 #Delete a filter and refresh the list
  Scenario: Uncheck a filter and get the list based on  the remaining filters
     Given I have checked "Neuf"
    And I have checked "50 à 100€"
    And I have checked "Intel core i5"
    When I uncheck "50 à 100€"
    Then the product list should refresh
    And only products that are new and have Intel core i5 should be displayed
    And the filter for "50 à 100€" should be unchecked


  # Reset filters and restore all
  Scenario: User resets filters after several selections
    Given I checked "Neuf"
    And I checked "50 à 100€"
    And I checked "Intel core i5"
    When I click "Tout supprimer"
    Then all filters should be unchecked
    And the complete product list should be restored
    And all filtering options should become visible again

  # Edge Case: Apply a filter and hide irrelevant filters
  Scenario: Hide filters with no relevance after applying one
    When I check "17” et plus" screen size
    Then the product list should refresh
    And only products with screen size 17” and more should be shown
    And filters that are no longer applicable should disappear
