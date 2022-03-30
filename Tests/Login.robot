*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
Suite Setup  Start WebTest
Suite Teardown  End WebTest
*** Test Cases ***

Login
    Input Text  //*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input   ${e-mail}
    Input Text  //*[@id="password"]  ${password}
    Click Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
    Wait Until Page Contains  Models