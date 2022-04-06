*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
Resource  ../Resources/createModelResource.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Can Create A Model
    [Documentation]   Test that verifies that a model is created.
    [Tags]  AG_16
    Login
    Create Model