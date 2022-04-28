*** Variables ***
${datapoints}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/span[2]
${demo_model_button}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button
${overview_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div
${connect_additional_datasets_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
${customer_support_continue}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/div[2]/button
${connect_datasets}  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
${header_element}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/nav/div[1]
${datapoints_customer_support}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/nav/div/span
*** Keywords ***
Select Demo Model
    Scroll Element Into View  ${demo_model_button}
    Wait Until Element Is Visible  ${demo_model_button}
    Click Element  ${demo_model_button}
    Wait Until Page Contains Element  ${header_element}
    Wait Until Page Contains  Agile Peacock
Verify Current Number Of Datapoints
    Wait Until Element Is Visible  ${datapoints}
    ${datapoint_as_string}  Get Text  ${datapoints}
    ${datapoint_one_dataset}  remove comma and convert  ${datapoint_as_string}
    Set Global Variable  ${datapoint_one_dataset}
    Should Be True  ${datapoint_one_dataset} == 1285
Go To Connect Additional Datasets
    Click Element  ${overview_button}
    Wait Until Page Contains  Test your model
    Scroll Element Into View  ${connect_additional_datasets_button}
    Click Element  ${connect_additional_datasets_button}
    Wait Until Page Contains  Pick a dataset to connect
Connect Additional Dataset
    Click Element  ${customer_support_continue}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
    Scroll Element Into View  ${connect_datasets}
    Click Element  ${connect_datasets}
    Go To  https://app.labelf.ai/main/375/models/view
    Wait Until Page Contains  Agile Peacock
Verify Number of Datapoints Second Dataset
    Wait Until Element Is Visible  ${datapoints_customer_support}
    ${datapoint_as_string_second_dataset}  Get Text  ${datapoints_customer_support}
    ${datapoint_second_dataset}  remove comma and convert  ${datapoint_as_string_second_dataset}
    Set Global Variable  ${datapoint_second_dataset}
    Should Be True  ${datapoint_second_dataset} == 1302
Verify Number Of Datapoints Increased
    Wait Until Element Is Visible  ${datapoints}
    ${datapoint_as_string_two_datasets}  Get Text  ${datapoints}
    ${datapoint_two_dataset}  remove comma and convert  ${datapoint_as_string_two_datasets}
    Should Be True  ${datapoint_two_dataset} <= ${datapoint_one_dataset}+${datapoint_second_dataset}
    Should Be True  ${datapoint_two_dataset} > ${datapoint_one_dataset}
    Should Be True  ${datapoint_two_dataset} > ${datapoint_second_dataset}

The User Has a Trained Model
    Login
    Press Create New Model
    Select Demo Model
    Verify Current Number Of Datapoints
    Go To Connect Additional Datasets
The User Connects An Additional Dataset
    Verify Number of Datapoints Second Dataset
    Connect Additional Dataset
The Number of Datapoints Displayed Under My Models Should Increase
    Verify Number Of Datapoints Increased
    Delete Model