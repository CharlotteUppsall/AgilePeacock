*** Variables ***
${model_labeled_percentage}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[4]/div/div/div/div/div/h2
${model_labeled_percentage_2}  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[4]/div/div/div/div/div/h2
${model_labeled_percentage_3}  //*[@id="app"]/div[10]/div[1]/main/div/div/div[2]/div/div[1]/div/div[4]/div/div/div/div/div/h2
${connect_additional_datasets_2}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
${choose_dataset_continue}  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div[3]/div/div/div[2]/button
${connect_additional_dataset}  //*[@id="app"]/div[5]/div/div/div/div[5]/div/div/div[3]/button
*** Keywords ***
Verify Percentage Of Model That Is Labeled
    Page Should Contain Element  ${model_labeled_percentage}
    ${model_labeled_percentage_string}  Get Text  ${model_labeled_percentage}
    ${model_labeled_percentage_int}  remove_total_items_text  ${model_labeled_percentage_string}
    Set Global Variable  ${model_labeled_percentage_int}
    Should Be True  ${model_labeled_percentage_int} == 90
Verify Percentage Of Model That Is Labeled Has Decreased
    Reload Page
    Wait Until Page Contains  support ticket routing model (1)
    Scroll Element Into View  ${model_labeled_percentage_2}
    ${model_labeled_percentage_string_2}  Get Text  ${model_labeled_percentage_2}
    ${model_labeled_percentage_int_2}  remove_total_items_text  ${model_labeled_percentage_string_2}
    Set Global Variable  ${model_labeled_percentage_int_2}
    Should Be True  ${model_labeled_percentage_int} > ${model_labeled_percentage_int_2}
Verify Percentage Of Model That Is Labeled Has Decreased More
    Reload Page
    Wait Until Page Contains  support ticket routing model (1)
    Scroll Element Into View  ${model_labeled_percentage_3}
    ${model_labeled_percentage_string_3}  Get Text  ${model_labeled_percentage_3}
    ${model_labeled_percentage_int_3}  remove_total_items_text  ${model_labeled_percentage_string_3}
    Should Be True  ${model_labeled_percentage_int_2} > ${model_labeled_percentage_int_3}
Wait Until Possible To Add Additional Dataset
    FOR  ${i}  IN RANGE  0  5  1
    Reload Page
    Wait Until Page Contains  support ticket routing model (1)
    Sleep  10s
    ${status}=  Run Keyword And Return Status  Page Should Not Contain Element  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span
    Run Keyword If  '${status}'=='True'  Connect Another Additional Dataset
    Exit For Loop If  '${status}'=='True'
    END
Connect Another Additional Dataset
    Scroll Element Into View  ${connect_additional_datasets_2}
    Click Element  ${connect_additional_datasets_2}
    Wait Until Page Contains  Pick a dataset to connect
    Click Element  ${choose_dataset_continue}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
    Wait Until Element Is Visible  ${connect_additional_dataset}
    Scroll Element Into View  ${connect_additional_dataset}
    Click Element  ${connect_additional_dataset}
    Sleep  2s
#Gherkin Keywords AG-112
User Has Added A Dataset With Existing Labels
    Login
    Create Support Ticket Demo Model
    Go To Connect Additional Datasets
The User Connects Additional Dataset
    Connect Additional Dataset
    Wait Until Page Contains  support ticket routing model (1)
    Verify Percentage Of Model That Is Labeled
The Percentage “Of Model Is Labeled” Should Be Lower Than 90%
    Verify Percentage Of Model That Is Labeled Has Decreased
#Gherkin Keywords AG-113
User Has Added Another Dataset With Lower Percentage Of Existing Labels
    Should Be True  ${model_labeled_percentage_int} > ${model_labeled_percentage_int_2}
The User Connects Another Additional Dataset
    Wait Until Possible To Add Additional Dataset
The Percentage “Of Model Is Labeled” Should Be Lower Than Previous Percentage
    Verify Percentage Of Model That Is Labeled Has Decreased More



