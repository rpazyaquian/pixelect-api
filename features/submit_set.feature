Feature: Submit Image Set

  Scenario:

    Anonymous user submits image set

    Given user is not signed in

    When user submits image set

    Then render the image set

  Scenario:

    Signed-in user submits image set

    Given user is signed in

    When user submits image set

    Then render the image set

