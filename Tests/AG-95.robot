*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Suite Setup  Start WebTest
Suite Teardown  mainResource.End WebTest
*** Test Cases ***
Verify Number Of Data Points Increased After Adding Additional Dataset
    [Documentation]  Verifies that the number of datapoints has increased by expected after adding another dataset
    [Tags]  AG_56  AG_95
    Login
    Press Create New Model
    Scroll Element Into View  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button
    Wait Until Element Is Visible  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button
    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button
    Wait Until Page Contains  Agile Peacock
    Sleep  10s
    Current Number Of Datapoints
    Delete Model

