Feature: Vote

  Scenario:

    Anonymous user votes on image

    Given user is not signed in

    When user votes on image

    Then return error
    And show register prompt

  Scenario:

    Signed-in user votes on image

    Given user is signed in

    When user votes on image

    Then show updated vote count