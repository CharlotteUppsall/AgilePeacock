*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  mainResource.End WebTest

*** Test Cases ***
Percentage Of Labeled Items Decreases After Adding Another Dataset To Model
    [Documentation]  Confirming that after disconnecting the additionally added dataset it is removed.
    [Tags]  AG_87  AG_112
    Given User Has Added A Dataset With Existing Labels
    When The User Connects Additional Dataset
    Then The Percentage “Of Model Is Labeled” Should Be Lower Than 90%
