*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

Confirm AG-111
   [Documentation]
   [Tags]  AG-111
   Login
   User Can Confirm AG-111-117