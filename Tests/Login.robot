*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
Library  ../Scripts/remove_text.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest
*** Test Cases ***

#    Wait Until Page Contains Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/nav/div[1]/a/div
#    Click Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/nav/div[1]/a/div
#    Wait Until Page Contains  Add a model
#    Input Text  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input  Test Model
#    Input Text  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/form/div[1]/div/div/div[2]/div/div/div[1]/div/textarea  Description
#    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/form/div[2]/button/div
#    Wait Until Page Contains  Labelf Demo Datasets
#    Scroll Element Into View  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div[3]/div/div[2]/div/div/div[2]/button/div
#    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div[3]/div/div[2]/div/div/div[2]/button/div
#    Wait Until Page Contains  Please click on the column

#Verify Number Of Models
#    Login Into Labelf
#    Sleep  3s
#    Verify Number Of Existing Models

User Can Delete Model
    Login
    Wait Until Page Contains  Models
    Wait Until Page Contains Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button
    Click Button   //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[3]/div/button
    Wait Until Page Contains Element  //*[@id="app"]/div[2]/div/div/div[2]/a
    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/a
    Wait Until Page Contains Element  //*[@id="app"]/div[6]/div/div/div[3]/button
    Click Button  //*[@id="app"]/div[6]/div/div/div[3]/button
    Wait Until Page Contains  You can create a new model by clicking the "NEW MODEL" button in the top right corner
    Sleep  3s
    Verify Number Of Existing Models