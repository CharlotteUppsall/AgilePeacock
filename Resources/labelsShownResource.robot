*** Variables ***
${chooseCustomerSupportDatasetButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div[1]/div/div/div[2]/button
${text_checkbox}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[1]/div/table/thead/tr[1]/th[1]/i
${checked_checkbox}  check_box
${labelf_demo_dataset}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/h2
${train_directly_on_labels_fram_an_existing_column}   //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${continue_to_setup3}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${continue_to_setup4}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/div/div[3]/button
${final_create_model_button}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button
${overview_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/div[1]/a
${dismiss_training_model_button}  //*[@id="app"]/div[3]/div/div/button
${labels_bar_chart}   //*[@id="plotly"]/div[1]/div
${labels_pie_chart}  //*[@id="plotly"]/div[1]/div
${connect_blabla_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[5]/div/div[3]/nav/div/span/button
${connect_blabla_button_grey}  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[5]/div/div[3]/nav/div/span

*** Keywords ***
Press Dataset With Existing Labels Button
    Scroll Element Into View  ${labelf_demo_dataset}
    #ovan: skrolla ner till andra rubriken för att en popup ruta annars skymmer knappen continue
    Wait Until Element Is Visible  ${chooseCustomerSupportDatasetButton}
    Click Element  ${chooseCustomerSupportDatasetButton}

Verify Text Button Is Checked
    Wait Until Element Is Visible  ${text_checkbox}
    ${variable_for_comparison}  Get Text  ${text_checkbox}
    Should Be Equal As Strings  ${variable_for_comparison}  ${checked_checkbox}

Select Train Directly On Labels
    Scroll Element Into View  ${train_directly_on_labels_fram_an_existing_column}
    Wait Until Element Is Enabled  ${train_directly_on_labels_fram_an_existing_column}
    Click Element  ${train_directly_on_labels_fram_an_existing_column}
    Click Element  ${continue_to_setup3}
    Scroll Element Into View  ${continue_to_setup3}
    Click Element  ${continue_to_setup4}
    Wait Until Element Is Visible  ${final_create_model_button}
    Click Element  ${final_create_model_button}

#Confirm Labels Are Shown after the model completed training

#Confirm Labels Are Shown before clicking on the overview button

#Confirm Labels Are Shown längre ner på sidan overview

Confirm Labels In Bar Chart
    Sleep  5s
    Wait Until Page Contains  My Models
    Sleep  5s
    Click Element  ${overview_button}
    Sleep  5s
    Wait Until Page Contains  training
    Click Element  ${dismiss_training_model_button}
    Wait Until Page Contains  Test your model
    Scroll Element Into View  ${labels_bar_chart}
    Wait Until Page Contains  Account
    Wait Until Page Contains  Billing
    Wait Until Page Contains  Delivery
    Wait Until Page Contains  Order
    Wait Until Page Contains  Refunds
    Wait Until Page Contains  Tech

scrolltest
    open browser
    maximize browser window
    sleep  3
    execute javascript  window.scrollTo(0,1500)

Confirm Labels In Pie Chart
    #Scroll Element Into View  ${labels_pie_chart}
    Scroll Element Into View  ${connect_blabla_button}
    Wait Until Page Contains  Predicted Label Distribution
    Wait Until Page Contains  Account
    Wait Until Page Contains  Billing
    Wait Until Page Contains  Delivery
    Wait Until Page Contains  Order
    Wait Until Page Contains  Refunds
    Wait Until Page Contains  Tech
    #Men hur veta att det är just texten i cirkeldiagrammet den kollar på
