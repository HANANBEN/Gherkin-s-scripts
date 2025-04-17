

Feature: Accessing the burger menu "Tout nos rayons"

  As a user
  I want to access the "Tout nos rayons" menu from the header
  So that I can browse available categories at any time

  Background:
    Given I am on any page of the website where the header is visible


  Rule: The "Tout nos rayons" menu should be accessible and responsive


    Scenario: Successfully open the burger menu from the header
       
      When I click on the "Tout nos rayons" button in the header
      Then the sidebar menu should appear
      And I should see a list of main categories displayed

    Scenario: Open the burger menu on a product subpage
      Given I navigate to a subpage like a product or category page
      When I click on the "Tout nos rayons" button in the header
      Then the sidebar menu should appear
      And I should see a list of main categories displayed


  Scenario: Close the burger menu by clicking the "X" button (positive path)

    Given I have opened the "Tout nos rayons" menu
    When I click on the "X" button to close the menu
    Then The sidebar menu should disappear from the screen
    And The previously displayed page should remain visible 




  Rule: The sidebar should behave correctly in edge cases

    Scenario: Menu burger does not open when clicked (negative case)
      When I click on the "Tout nos rayons" button
      And the sidebar fails to appear
      Then I should see an error message "un échec d’affichage" with a button to report it 

    Scenario: Sidebar appears but no categories are displayed (negative case)
      Given the sidebar is visible
      When there are no categories loaded
      Then I should see a message like "Aucune catégorie disponible"

    Scenario: Clicking a broken category link (negative case)
      Given I opened the "Tout nos rayons" sidebar
      And the "Informatique" category link points to a broken URL
      When I click on the "Informatique" category
      Then I should see a 404 error or a fallback message

    Scenario: Try to open the burger menu with slow network (graceful fallback)
      Given I have a slow internet connection
      When I click on the "Tout nos rayons" button
      Then the sidebar should still appear within a reasonable time
      And the loading indicator should be displayed if needed

    Scenario: Attempt to open the burger menu when header is not loaded (negative path)
      Given the page is still loading and the header has not rendered
      When I try to click on the "Tout nos rayons" button
      Then the action should not be possible
      And I should see no menu interaction


   
