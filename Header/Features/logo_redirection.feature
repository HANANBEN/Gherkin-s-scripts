



Feature: Redirection to home page via logo click

  As a user
  I want to be able to click on the Cdiscount logo
  So that I am redirected to the homepage

  Background:
   Given I am on the landing page
   And I am <authenticationStatus>

   Examples:
 
  | a visitor                  |
  | logged in as a regular user |

  Rule: Clicking on the logo should always take the user to the homepage



   Scenario: The header contains the logo on every main page
        
        Given I am navigating through the site
        Then I should always see the Cdiscount logo in the header


    Scenario: User clicks on the Cdiscount logo (positive path)
      When I click on the Cdiscount logo
      Then I should be redirected to the homepage
      And the homepage URL should be "https://www.cdiscount.com"
      And I should see the main banner or homepage content

    Scenario: Logo is not clickable (negative case)
      Given the logo is visible
      But it is not wrapped in a link
      When I try to click the logo
      Then nothing should happen
      And I should still be on the landing page

    Scenario: Broken or incorrect link on logo (negative path)
      Given the logo is a clickable link
      But the link points to "https://www.cdiscount.com/404"
      When I click on the Cdiscount logo
      Then I should be redirected to a 404 error page
      And I should not see the homepage banner

