*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User can confirm that there is an updated sequence to include a step to select column
    [Documentation]  Confirm setup steps are updated to include a step to select column
    [Tags]  AG_18
    Login
    Confirm Setup

User Can Confirm Change of Text For Step 3 When "Train Directly[...]" Is Disabled
     [Documentation]  When slider "Train directly on labels from an existing column” is disabled step 3 is changed to: Name your model
     [Tags]   AG_18
     Confirm Text Has Changed When Function Disabled
     Go Back
#Overview of labels are displayed
 #   [Documentation]  Test will verify that labels from chosen dataset is present after creating model
 #   [Tags]  AG_64

 #   Press Create New Model
 #   Press Continue To Model Creation
 #   Press Dataset With Existing Labels Button
 #   Verify Text Button Is Checked
 #   Select Train Directly On Labels
 #   Confirm Labels In Model View
 #   Navigate To Model Overview
 #   Confirm Labels In Bar Chart
 #   Scroll Down To Pie Chart
 #   Confirm Labels In Pie Chart
 #   Go Back
 #   Delete Model
User Can Select Column Containing The Labels
    [Documentation]  Verifies that a user can select a column containing labels
    [Tags]  AG_18
    Given A Dataset With Existing Labels Has Been Selected
    And "Train Directly On Labels From An Existing Column" Has Been Enabled
    When The User Clicks Continue
    Then It Shall Be Possible To Select A Column Which Contains The Labels

User Can Select Column Containing The Labels - Dataset 2
    [Documentation]  Verifies that a user can select a column containing labels
    [Tags]  AG_18
    Given A Dataset With Existing Labels Has Been Selected - Dataset 2
    And "Train Directly On Labels From An Existing Column" Has Been Enabled
    When The User Clicks Continue
    Then It Shall Be Possible To Select A Column Which Contains The Labels
User Can Select Column Containing The Labels - Dataset 3
    [Documentation]  Verifies that a column is automatically selected when only one column exists
    [Tags]  AG_18
    Given A Dataset With Existing Labels Has Been Selected - Dataset 3
    And "Train Directly On Labels From An Existing Column" Has Been Enabled
    When The User Clicks Continue
    Then The Column That Contains The Labels Has Been Selected
User Can Select Column Containing The Labels - Dataset 4
    [Documentation]  Verifies that a column is automatically selected when only one column exists
    [Tags]  AG_18
    Given A Dataset With Existing Labels Has Been Selected - Dataset 4
    And "Train Directly On Labels From An Existing Column" Has Been Enabled
    When The User Clicks Continue
    Then The Column That Contains The Labels Has Been Selected

