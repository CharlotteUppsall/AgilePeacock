*** Variables ***
${click_pre-existing_model}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div
${click_text_area2}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div[2]/div/div[1]/div/div[1]/div/textarea
${submit_knapp}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div[2]/div/div[2]/button[2]
${e-mail2}   ann.christine.phan@iths.se
${password}  123456789
${category_account}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div[2]/div/div[3]/div[1]/nav/div[1]/div[1]

*** Keywords ***

Start WebTest
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Go To  https://app.labelf.ai/login
    Wait Until Element Is Visible  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/div
    Click Button  //*[@id="diffuse-cookie-notice"]/div/div/div/div[2]/button[3]

End WebTest
    Close All Browsers

Enter Account Information
    Input Text  //*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input   ${e-mail2}
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

#Koden som ligger överst här är för att man inte ska ändra mainResource; för att jag har min egna workspace på mitt egna konto
#Därför har jag koden här så att den kan loggas in på rätt workspace

Log In To Personal Workspace
    Login
    Go To  https://app.labelf.ai/main/376/models/view

Input New Label To Trained Model
    Click Element   ${click_pre-existing_model}
    Wait Until Element Is Visible  ${click_text_area2}
    Click Element   ${click_text_area2}
    Input Text   ${click_text_area2}   Forgot Password
    Click Button   ${submit_knapp}

Verify Added Label
    Wait Until Page Contains   95%
    ${verify_categorization}  Get Text   ${category_account}
    Should Be Equal As Strings  ${verify_categorization}   Account


