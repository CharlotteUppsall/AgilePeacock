*** Variables ***
${e_mail_stag}  joakim.sorkka@iths.se
${password_stag}  123456789
${checkbox_should_be}  check_box
${choose_dataset_right}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
${label_switch}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${continue_button2}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${intent_checkbox}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th[2]
${category_checkbox}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[1]/div/table/thead/tr[1]/th[1]
${exit_button}  //*[@id="app"]/div[2]/div/div/nav/div/a/div
*** Keywords ***
Choose Dataset
    Wait Until Element Is Visible  ${choose_dataset_right}
    Scroll Element Into View  ${choosedatasetbutton}
    Click Element  ${choose_dataset_right}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
Enable Train Directly On Labels
    Wait Until Element Is Visible  ${label_switch}
    Click Element  ${label_switch}
Verify Train Directly On Labels Is Enabled
    Wait Until Page Contains  Select the column which contains the labels
Press Continue
    Wait Until Element Is Visible  ${continue_button2}
    Click Element  ${continue_button2}
    Verify Continue Is Pressed
Verify Continue Is Pressed
    Wait Until Page Contains  Please click on the column containing the labels
Press Intent Checkbox
    Wait Until Element is Visible  ${intent_checkbox}
    Click Element  ${intent_checkbox}
Press Category Checkbox
    Wait Until Element is Visible  ${category_checkbox}
    Click Element  ${category_checkbox}
Verify Category Button Is Checked
# Compares if expected string matches actual string.
    ${check_box1}  Get Text  ${category_checkbox}/i
    Should Be Equal As Strings  ${check_box1}  ${checkbox_should_be}
Verify Intent Button Is Checked
# Compares if expected string matches actual string.
    ${check_box2}  Get Text  ${intent_checkbox}/i
    Should Be Equal As Strings  ${check_box2}  ${checkbox_should_be}
Exit Model Creation
    Click Element  ${exit_button}
    Verify Model Creation Exit
Verify Model Creation Exit
    Wait Until Page Contains  Welcome to Labelf!
A Dataset With Existing Labels Has Been Selected
    Login
    Press Create New Model
    Press Continue To Model Creation
    Choose Dataset
"Train Directly On Labels From An Existing Column" Has Been Enabled
    Enable Train Directly On Labels
    Verify Train Directly On Labels Is Enabled
The User Clicks Continue
    Press Continue
It Shall Be Possible To Select A Column Which Contains The Labels
    Press Intent Checkbox
    Verify Intent Button Is Checked
    Press Category Checkbox
    Verify Category Button Is Checked

