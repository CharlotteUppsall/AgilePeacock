*** Variables ***
${e-mail}  oskar.hagman@iths.se
${password}  123456789

*** Keywords ***
Start WebTest
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Go To  https://app.labelf.ai/login
    Wait Until Page Contains  Labelf
    Sleep  5s
    Click Button  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
End WebTest
    Close All Browsers
Login
    Input Text  //*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input   ${e-mail}
    Input Text  //*[@id="password"]  ${password}
    Wait Until Page Contains  Labelf
    Click Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
    Wait Until Page Contains  Models
Verify Number Of Existing Models
    Wait Until Page Contains  Models
    ${element_text}  Get Text  //*[@id="app"]/div[6]/div[1]/main/div/div/nav/div/div[1]
    ${actual_amount}  convert into number  ${element_text}
    Should Be True  ${actual_amount} == 0