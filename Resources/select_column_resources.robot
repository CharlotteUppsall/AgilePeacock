*** Variables ***
${e_mail_stag}  joakim.sorkka@iths.se
${password_stag}  123456789
${checkbox_should_be}  check_box
*** Keywords ***
A Dataset With Existing Labels Has Been Selected
    Login
    Press Create New Model
    Press Continue To Model Creation
    Sleep  2s
    Scroll Element Into View  ${choosedatasetbutton}
    Wait Until Element Is Visible  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
    Sleep  2s
"Train Directly On Labels From An Existing Column" Has Been Enabled
    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
    Wait Until Page Contains  Select the column which contains the labels
The User Clicks Continue
    Wait Until Element Is Visible  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
    Sleep  3s
    Wait Until Page Contains  Please click on the column containing the labels
    Sleep  2s
It Shall Be Possible To Select A Column Which Contains The Labels
    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th[2]
    Sleep  2s
    Click Element  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th[1]
    Sleep  2s
    Verify Category Button Is Checked
    Sleep  3s
    Click Element  //*[@id="app"]/div[2]/div/div/nav/div/a/div
    Wait Until Page Contains  Welcome to Labelf!
    Sleep  2s
Enter Account Information Stag
    Input Text  //*[@id="app"]/div/main/div/div/div/div/div/div[1]/form/div[1]/div[2]/div[1]/div/input   ${e_mail_stag}
    Input Text  //*[@id="password"]  ${password_stag}
    Wait Until Page Contains  Labelf
Press Login Button Stag
    Click Element  //*[@id="app"]/div/main/div/div/div/div/div/div[2]/button[2]
Verify Login Stag
    Wait Until Page Contains  Models
Login To Stag
    Enter Account Information Stag
    Press Login Button Stag
    Verify Login Stag
Verify Category Button Is Checked
    ${check_box}  Get Text  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th[1]/i
    Should Be Equal As Strings  ${check_box}  ${checkbox_should_be}
