


Feature: Shopping Cart Access and Interactions from the Header

  As a user,
  I want to interact with the shopping cart icon in the header
  So that I can preview, update, or access the full cart contents

  Background:
    Given I am on a page where the header is visible

  Rule: Hovering over the cart icon shows a preview panel

    Scenario: Display "Panier vide" when cart is empty
      When I hover over the "Cart" icon
        And my cart is empty
      Then a preview panel should appear
      And it should display the message "Panier vide"
      And no products should be shown

    Scenario: Display product list when cart has items
      Given My cart contains one or more items
      When I hover over the "Cart" icon
      Then a preview panel should appear
      And all items in the cart should be listed with image, name, quantity, and price
      And controls should be available to update quantity or remove items

    Scenario: Update item quantity from the cart panel
      Given My cart contains at least one item
      When I increase the quantity of an item from the panel
      Then the updated quantity should be reflected
      And the total price should adjust accordingly

    Scenario: Remove an item from the cart panel
      Given My cart contains multiple items
      When I click on the "Remove" icon of an item
      Then that item should disappear from the panel
      And the cart total should be updated

    Scenario: Empty cart after removing all items
      Given My cart contains several items
      When I remove all items from the preview panel
      Then the panel should display the message "Panier vide"

  Rule: Clicking the cart icon redirects to the cart page

    Scenario: Access the full cart page
      When I click on the "Cart" icon
      Then I should be redirected to the cart summary page
      And all current cart items should be displayed


     # Negative Path Scenarios

  Rule: Gracefully handle issues during cart interaction

    Scenario: Failure to load cart panel
      Given I have items in my cart
      When I hover over the "Cart" icon
      And the cart service is temporarily unavailable
      Then no panel should appear
      And a generic error message like "Impossible de charger votre panier" should be shown
      

    Scenario: Failure to update item quantity
      Given My cart contains at least one item
      When I attempt to change the item quantity
      And the update fails due to a server issue
      Then an error message should be displayed near the item
      And the quantity should not change

    Scenario: Failure to remove an item
      Given My cart contains multiple items
      When I click on "Remove" for an item
      And the request to remove fails
      Then the item should remain in the list
      And an error notification should be shown to the user

    Scenario: Cart page fails to load
      When I click on the "Cart" icon
      And the cart page fails to load
      Then I should see an error message or fallback page
      And I should be able to retry or go back to the homepage

