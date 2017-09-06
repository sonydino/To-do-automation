Feature: Add Button

  Scenario: click and verify the task page

    Given I click on Add task icon
    And I navigate to Add task page
    Then the page should have buttons
      | Submit |
      | Reset  |

    And the page should have text box
      | Title       |
      | Description |
    And the page should have the date and time range

  Scenario: create and submit the new task
    Given I create new task with filling up following fields
      | KEY         | VALUE                       |
      | Title       | My Title                    |
      | Description | This is for testing purpose |
      | Date        | 04/03/2017                  |
      | Time        | 04:30AM                     |
    And click on submit button
    #Then page should navigate back to page index page

    Scenario: Verify the Reset Button
      Given I click on Add icon
     When I click on Reset page
      Then Page should get reset

  Scenario: To verify the title box is required to be filled
    Given On the Add task page click on Submit button without filling any value
    #Then a popup message should come up mentioning title field is required
    Then Verify the Title field should take only 50 characters
    And Description should take onbly 250 characters

    Scenario: Click on Back button
      Given On add task page click on Back icon
     # Then it should go back to main page








