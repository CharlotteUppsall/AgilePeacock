*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

Verify "Connect Additional Dataset" Button On Model Overview
    [Documentation]  Test verifies that the "Connect Additional Dataset"-button is present in the model overview page
    [Tags]  AG_56   AG-88
    Given A model has been created
    When The model overview page is opened
    Then Connect additional datasets button shall be shown

Datasets Available To Connect Are Displayed For The User
    [Documentation]  Test verifies uploaded datasets are present in the "My Datsets" list
    [Tags]  AG_56  AG_89
    Given a dataset is uploaded
    And the dataset isn't connected to the model
    And user is on the model overview page
    When user clicks on the "connect additional dataset"-button
    Then the dataset is displayed in the "My Datasets"-list

Connected Datasets Are Displayed In A List For The User
    [Documentation]  The connected dataset should be listed under Connected datasets on the model overview
    [Tags]  AG_56  AG_91
    Given The user is on the “Datasets available to connect” page
    And The Continue button for a dataset is clicked
    When User clicks on the connect button
    Then The dataset is listed under Connected datasets on the model overview
