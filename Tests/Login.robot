*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
*** Test Cases ***
Go To WebPage
    Open Browser  about:blank  chrome
    Go To  https://app.labelf.ai/login
    Wait Until Page Contains  Labelf
    Close Browser