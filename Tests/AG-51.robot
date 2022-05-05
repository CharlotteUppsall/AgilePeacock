*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User can add a label to a trained customer suppport model and verify that it works
    [Documentation]  Add label and confirm/verify them to a pre-existing trained model
    [Tags]  AG_51 (AG-69, AG-70, AG-71)
    Login
    Create Support Ticket Demo Model
    Input New Label To Trained Model
    Verify Added Label
    Cleanup