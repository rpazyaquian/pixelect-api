Feature: Comment

  Scenario:

    Anonymous user submits comment

    Given user is not signed in

    When user submits comment

    Then return error
    And show register prompt

  Scenario:

    Signed-in user submits comment

    Given user is signed in

    When user submits comment

    Then render comment