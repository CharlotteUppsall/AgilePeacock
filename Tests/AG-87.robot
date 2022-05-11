*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  mainResource.End WebTest

*** Test Cases ***
Percentage Of Labeled Items Decreases From 90% After Adding Another Dataset To Model
    [Documentation]  Confirming that after connecting additional dataset precentage of labeled items < 90%
    [Tags]  AG_87  AG_112
    Given User Has Added A Dataset With Existing Labels
    When The User Connects Additional Dataset
    Then The Percentage “Of Model Is Labeled” Should Be Lower Than 90%
Percentage Of Labeled Items Decreases After Adding Another Dataset To Model
    [Documentation]  Confirming labeled items decrease after adding an additional dataset with lower labeled items
    [Tags]  AG_87  AG_113
    Given User Has Added Another Dataset With Lower Percentage Of Existing Labels
    When The User Connects Another Additional Dataset
    Then The Percentage “Of Model Is Labeled” Should Be Lower Than Previous Percentage
