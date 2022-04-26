*** Variables ***
${datapoints}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/span[2]
*** Keywords ***
Verify Current Number Of Datapoints
    Wait Until Element Is Visible  ${datapoints}
    ${datapoint_as_string}  Get Text  ${datapoints}
    ${datapoint_one_dataset}  remove comma and convert  ${datapoint_as_string}
    Set Global Variable  ${datapoint_one_dataset}
    Should Be True  ${datapoint_one_dataset} == 1285
Go To Connect Additional Datasets
    Click Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div
    Wait Until Page Contains  Test your model
    Scroll Element Into View  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
    Click Element  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
    Wait Until Page Contains  Pick a dataset to connect
Connect Additional Dataset
    Sleep  2s
    Click Element  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[2]/div[1]/div/div/div[2]/button
    Wait Until Page Contains  Please click on the column containing the text you want to classify
    Scroll Element Into View  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
    Click Element  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
    Go To  https://app.labelf.ai/main/375/models/view
    Wait Until Page Contains  Agile Peacock
Verify Number Of Datapoints Increased
    Wait Until Element Is Visible  ${datapoints}
    ${datapoint_as_string_two_datasets}  Get Text  ${datapoints}
    ${datapoint_two_dataset}  remove comma and convert  ${datapoint_as_string_two_datasets}
    Should Be True  ${datapoint_two_dataset} > ${datapoint_one_dataset}