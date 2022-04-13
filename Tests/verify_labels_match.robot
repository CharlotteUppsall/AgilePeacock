*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
Resource  ../Resources/select_column_resources.robot
Resource  ../Resources/createModelResource.robot
Library  ../Scripts/remove_text.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

Verify Labels In Overview Match Expected Labels
    [Documentation]  Test that verifies that the labels in the dataset are also shown on Overview page.
    [Tags]  Partial_verification_test
    Login
    Go To  https://app.labelf.ai/main/384/models/view
    Wait Until Page Contains  Models
    Sleep  3s
    Click Element  //*[@id="app"]/div[8]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/nav/div
    Wait Until Page Contains  Test your model
    Sleep  3s
    Scroll Element Into View  //*[@id="plotly"]/div[1]/div
    Sleep  3s
    Wait Until Page Contains  ACCOUNT