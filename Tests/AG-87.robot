*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  mainResource.End WebTest

*** Test Cases ***

User Can Remove Dataset After Connecting An Additional Dataset
    [Documentation]  Confirming that after disconnecting the additionally added dataset it is removed.
    [Tags]  AG_87  AG_111
#Given that user had added another dataset with existing labels
    Login
    Create Support Ticket Demo Model
#When the user disconnects the dataset from “Connected Datasets”
#Then it should’ve been removed from the “connected dataset”
