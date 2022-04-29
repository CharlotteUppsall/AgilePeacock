*** Variables ***
${e-mail}  oskar.hagman@iths.se
${password}  123456789

*** Keywords ***
Start WebTest
    Open Browser  about:blank  headlesschrome
    Register Keyword To Run On Failure  NONE
    Set Selenium Speed  0.2s
    Set Window Size  1920  1080
    Go To  https://app.labelf.ai/login
    Wait Until Element Is Visible  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/div
    Click Button  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]
End WebTest
    Run Keyword If Any Tests Failed  Cleanup
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
