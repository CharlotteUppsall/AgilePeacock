*** Variables ***
${model_labeled_percentage}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[4]/div/div/div/div/div/h2
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
    Scroll Element Into View  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[4]/div/div/div/div/div/h2
    ${model_labeled_percentage_string_2}  Get Text  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[4]/div/div/div/div/div/h2
    ${model_labeled_percentage_int_2}  remove_total_items_text  ${model_labeled_percentage_string_2}
    Set Global Variable  ${model_labeled_percentage_int_2
    Should Be True  ${model_labeled_percentage_int} > ${model_labeled_percentage_int_2}
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



