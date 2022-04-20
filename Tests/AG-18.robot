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