Feature: Add Task Button

  Scenario: Verify the Add task page
    Given I'm on Add task page
#    Then the page should have Title text box
#    And page should have Add button


#  Scenario: Add Task and verify the task
#    Given I create a new task with filling text on Title box
#    Given I create task with name " " and priority ""
##    And select priority from dropdown
##    When Click on Add button
#    Then The task should be viewed on the page

    Scenario: Add and Delete the task and then verify
      Given I click on Add button without Title field filled
      Given I create task with Title "Task1" and priority "High"
      Given I create task with Title "Task12" and priority "Low"
      Given I create task with Title "Task123" and priority "Medium"
      And Verify listed order of priority
       Then I delete task with name "Task1" and priority "High"
      And Verify that Title with "Task1" and priority with "High" is not listed


    Scenario: Verify the Done task is greyed out
      Given I create task with Title "Task1234" and priority "High"
      When I click on Done checkbox with Title "Task1234" and priority "High"
     Then the row with Title "Task1234" and priority "High" should be greyed out


