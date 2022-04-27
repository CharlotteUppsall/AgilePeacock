*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User can add a label to a trained customer suppport model and verify that it works
    [Documentation]
    [Tags]  AG-52 (AG-81, AG-82, AG-83, AG-84)
    Login
    Create Support Ticket Demo Model
    Go To Start Training Page
    Go Back
    Cleanup