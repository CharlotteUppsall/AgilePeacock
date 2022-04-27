*** Settings ***
Resource  ../resourceGate.robot
*** Variables ***
${start_training_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[6]
${add_label_button}  //*[@id="app"]/div[15]/div/div[1]/div[3]/div/a
*** Keywords ***

Go To Model Overview
    Wait Until Page Contains Element  ${click_pre-existing_model}
    Click Element   ${click_pre-existing_model}
Verify Start Training Is Clicked
    Wait Until Element Is Visible  ${add_label_button}
Press Start Training Button
    Wait Until Element Is Visible  ${start_training_button}
    Click Element  ${start_training_button}
Go To Start Training Page
    Go To Model Overview
    Press Start Training Button
    Verify Start Training Is Clicked
