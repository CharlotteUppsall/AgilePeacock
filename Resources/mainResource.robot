*** Variables ***
${e-mail}  oskar.hagman@iths.se
${password}  123456789

*** Keywords ***
Start WebTest
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Go To  https://app.labelf.ai/login
    Wait Until Page Contains  Labelf
    Click Button  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
End WebTest
    Close All Browsers
Login Into Labelf
    Input Text  //*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input   ${e-mail}
    Input Text  //*[@id="password"]  ${password}
    Wait Until Page Contains  Labelf
    Click Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
    Wait Until Page Contains  Models