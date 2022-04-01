*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

User Log In
    Login Into Labelf


