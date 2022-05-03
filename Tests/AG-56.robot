*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Library  ../Scripts/remove_text.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

Datasets available to connect are displayed for the user
    [Documentation]  Test verifies uploaded datasets are present in the "My Datsets" list
    [Tags]  AG_89
    Given a dataset is uploaded
    And the dataset isn't connected to the model
    And user is on the model overview page
    When user clicks on the "connect additional dataset"-button
    Then the dataset is displayed in the "My Datasets"-list


