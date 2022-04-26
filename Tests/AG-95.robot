*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  mainResource.End WebTest
*** Test Cases ***
Verify Number Of Data Points Increased After Adding Additional Dataset
    [Documentation]  Verifies that the number of datapoints has increased by expected after adding another dataset
    [Tags]  AG_56  AG_95
    Given The User Has a Trained Model
    When The User Connects An Additional Dataset
    Then The Number of Datapoints Displayed Under My Models Should Increase

