*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
Resource  ../Resources/select_column_resources.robot
Resource  ../Resources/createModelResource.robot
Library  ../Scripts/remove_text.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

User Can Select Column Which Contains The Labels
    [Documentation]  Verifies that a user can select a column containing labels
    [Tags]  AG_18
    Given A Dataset With Existing Labels Has Been Selected
    And "Train Directly On Labels From An Existing Column" Has Been Enabled
    When The User Clicks Continue
    Then It Shall Be Possible To Select A Column Which Contains The Labels
