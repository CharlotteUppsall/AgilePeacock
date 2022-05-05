*** Variables ***
${e-mail}  oskar.hagman@iths.se
${password}  123456789

*** Keywords ***
Start WebTest
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Set Selenium Speed  0.5s
    #Set Window Size  1920  1080
    Go To  https://app.labelf.ai/login
    Wait Until Element Is Visible  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/div
    Click Button  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
End WebTest
    Close All Browsers
Enter Account Information
    Input Text  //*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input   ${e-mail}
    Input Text  //*[@id="password"]  ${password}
    Wait Until Page Contains  Labelf
Press Login Button
    Click Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
Verify Login
    Wait Until Page Contains  Models
Login
    Enter Account Information
    Press Login Button
    Verify Login

Begin Web Test
    Open Browser  about:blank  headlesschrome
    Set Selenium Speed  0.1s
    Set Window Size  1920  1080
    Go To  https://app.labelf.ai/login
    Wait Until Element Is Visible  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/div
    Click Button  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
    Enter Account Information
    Press Login Button
    Verify Login