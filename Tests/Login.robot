*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

User Log In
    [Documentation]  On the login page, the test will insert credentials, log in and go to the start page/ "Models view"
    [Tags]  Login
    Login Into Labelf


