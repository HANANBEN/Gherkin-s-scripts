


Feature: Dynamic category filtering via the "Tout nos rayons" sidebar

  As a user
  I want to navigate through multi-level filters dynamically
  So that I can access relevant products without hardcoding each path

  Background:
    Given I am on any page with the header visible
    And I open the "Tout nos rayons" sidebar from the header
    And I see the list of main categories displayed



    Scenario Outline: Display products based on filter levels
  Given clicked on one of the categories dislayed
  When I navigate through the filters:
    | <level1> |
    | <level2> |
    | <level3> |
  And I click on "Tout l'univers"
  Then I should see product results for "<expectedResult>"

Examples:
  | level1       | level2        | level3      | expectedResult     |
  | <Category A> |               |             | <Category A>       |
  | <Category B> | <Sub B1>      |             | <Sub B1>           |
  | <Category C> | <Sub C1>      | <Sub C2>    | <Sub C2>           |



    Scenario: Show product list when clicking "Tout l'univers" at any level 
    
      Given I have successfully filtered products through the sidebar
      
      Then the system should display the filtered product list
      And a tree for the selected filter levels should be displayed
      And the product list should be relevant to the selected filters




  Scenario: Automatically show product list when reaching the last filter level

      Given the current filter level is the deepest level available
      When I select the last subcategory
      Then the system should automatically display the filtered product list

   
Scenario: Stop at any level and display filtered results
  Given I have selected one or more levels in the filter path
  When I trigger the result display for the current selection
  Then I should see a list of products matching the selected filter level


    



