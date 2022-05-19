*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

User Can Confirm Added Dataset Not Shown In List
    [Documentation]  Verifies that a column is automatically selected when only one column exists
    [Tags]  AG_87, AG_111
    Given User Is Logged In
    And  An Additonal Dataset Has Been Connected
    When User Clicks Connect Additional Dataset
    Then Additional Connected Dataset Is Not Shown In List

User Can Confirm Added Dataset Not Shown In List
    [Documentation]  Verifies that a column is automatically selected when only one column exists
    [Tags]  AG_87, AG_117
    Given User Is Logged In
    And  An Additonal Dataset Has Been Connected
    When User Disconnects Connected Dataset
    Then User Can Confirm Dataset Has Been Disconnected

# User Can Confirm AG-111 And AG-117
#   [Documentation]
#   [Tags]  AG_87, AG_111, AG_117
#   Login
#   User Can Confirm AG-111 And AG-117