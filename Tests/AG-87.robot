*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Library  ../Scripts/remove_text.py
Library  ../Scripts/convert_a_String_to_an_integer.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest For Jennifer

*** Test Cases ***

Total items and labeled items are updated
    [Documentation]  The test will verify that the number of total items and labeled items have increased after a dataset has been connected
    [Tags]  AG-87  AG_110
    Given a single label dataset with the same labels as in the model is not yet connected
    When the user connects the new dataset from the model overview
    Then the total items and labled items are updated



