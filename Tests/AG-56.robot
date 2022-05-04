*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Library  ../Scripts/remove_text.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

Confirm Button "Connect Additional Dataset" Visible On Model Overview
    [Documentation]  Test verifies that the "Connect Additional Dataset"-button is present in the model overview page
    [Tags]  AG-88
    Given A model has been created
    When The model overview page is opened
    Then Connect additional datasets button shall be shown


#--------------------------------------------------------------------------

Datasets available to connect are displayed for the user
    [Documentation]  Test verifies uploaded datasets are present in the "My Datsets" list
    [Tags]  AG_89
    Given a dataset is uploaded
    And the dataset isn't connected to the model
    And user is on the model overview page
    When user clicks on the "connect additional dataset"-button
    Then the dataset is displayed in the "My Datasets"-list


#--------------------------------------------------------------------------

Connected datasets are displayed in a list for the user
    [Documentation]
    [Tags]  AG_91
    Given The user is on the “Datasets available to connect” page
    And The Continue button for a dataset is clicked
    When User clicks on the connect button
    Then The dataset is listed under Connected datasets on the model overview


#--------------------------------------------------------------------------



