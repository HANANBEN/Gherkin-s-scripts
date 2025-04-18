




Feature: Product detail navigation from product list

  As a user
  I want to click on a product in the product list
  So that I can be redirected to its detail page
  And verify that the product's image, title, and price are exactly the same as in the list

  Background:
    Given I am on the any page of the website where the product list is displayed
    And the product title is visible and clickable


  # positive Path - Correct redirection and data matching

  Scenario: Click on a product and verify consistent product details
    When I click on any product titled 
    Then I should be redirected to the product detail page
    And I should see the same image as in the list
    And I should see the same title 
    And I should see the same price as displayed in the list
    And other product details should be displayed correctly for that product
    

  #verification Path - Multiple products in list
  Scenario: Click on different products and verify each one
    When I click on the second product in the list
    Then I should be redirected to its detail page
    And its image, title, and price should match exactly with what was displayed in the list

  # edge Case - Product with long title
  Scenario: Navigate to a product with a long title
    Given a product in the list has a long title 
    When I click on it
    Then I should see the full title displayed correctly on the detail page
    And the image and price should match those from the product list

  # edge Case - Product missing image
  Scenario: Product in the list has no image
    Given a product in the list has no image
    When I click on it
    Then I should be redirected to the detail page
    And I should see a placeholder image like "Image non disponible"
    And the title and price should still match

  # edge Case - Product with promotional price
  Scenario: Product has a discount or promotional price
    Given the product shows both original and discounted prices in the list
    When I click on it
    Then I should see both prices reflected exactly on the detail page

  # negative Path - Product no longer exists
  Scenario: Product clicked is no longer available
    When I click on a product that has just been removed from inventory
    Then I should see a message like "Ce produit n’est plus disponible"
    And I should be redirected back to the product list or a fallback page


  # retry scenario
  Scenario: User reloads detail page to verify persistence
    When I click on a product and reach the detail page
    And I refresh the browser
    Then the product information should persist and match the list

