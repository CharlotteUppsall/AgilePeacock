*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest
*** Test Cases ***

User Can Create New Model
    Login Into Labelf
#    Wait Until Page Contains Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/nav/div[1]/a/div
 #   Click Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/nav/div[1]/a/div
  #  Wait Until Page Contains  Add a model
   # Input Text  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input  Test Model
    #Input Text  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/form/div[1]/div/div/div[2]/div/div/div[1]/div/textarea  Description
    #Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/form/div[2]/button/div
    #Wait Until Page Contains  Labelf Demo Datasets
    #Scroll Element Into View  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div[3]/div/div[2]/div/div/div[2]/button/div
    #Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div[3]/div/div[2]/div/div/div[2]/button/div
    #Wait Until Page Contains  Please click on the column
