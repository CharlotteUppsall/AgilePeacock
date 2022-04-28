*** Settings ***
Resource  ../resourceGate.robot
*** Variables ***

${first_leave_training_page}  //*[@id="app"]/div[16]/div/div[1]/div[1]/div/div/nav/div/a/div
${second_leave_training_page}  //*[@id="app"]/div[5]/div/div[1]/div[1]/div/div/nav/div/a/div
${third_leave_training_page}  //*[@id="app"]/div[15]/div/div[1]/div[1]/div/div/nav/div/a/div
${fourth_leave_training_page}  //*[@id="app"]/div[6]/div/div[1]/div[1]/div/div/nav/div/a/div
${model_id}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[1]
${start_training_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[6]
${add_label_button}  //*[@id="app"]/div[6]/div/div[1]/div[3]/div/a
${other_add_label_button}  //*[@id="app"]/div[15]/div/div[1]/div[3]/div/a
${third_option_add}  //*[@id="app"]/div[5]/div/div[1]/div[3]/div/a
${new_label_name_text_field}  //*[@id="app"]/div[2]/div/div/form/div[2]/div/div/div[1]/div/div/div[1]/div/input
${new_label_example_text_field}  //*[@id="app"]/div[2]/div/div/form/div[2]/div/div/div[3]/div/div[2]/div/div[1]/div/div/div[1]/div/input
${submit_add_new_label}  //*[@id="app"]/div[2]/div/div/form/div[3]/button
${total_items_text}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]
${total_labeled_items_text}  //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]
*** Keywords ***

Check For Fourth Option Leave Training
    FOR  ${i}  IN RANGE  0  5  1
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${fourth_leave_training_page}
    Run Keyword If  '${status}'=='True'  Click Element  ${fourth_leave_training_page}
    ...   ELSE IF  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
    Run Keyword If  '${status}'=='False'  Test Failsafe Skip
Check For Third Option Leave Training
    FOR  ${i}  IN RANGE  0  5  1
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${third_leave_training_page}
    Run Keyword If  '${status}'=='True'  Click Element  ${third_leave_training_page}
    ...   ELSE IF  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
    Run Keyword If  '${status}'=='False'  Check For Fourth Option Leave Training
Check For Second Leave Button Training
    FOR  ${i}  IN RANGE  0  5  1
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${second_leave_training_page}
    Run Keyword If  '${status}'=='True'  Click Element At Coordinates  ${second_leave_training_page}  2  0
    ...   ELSE IF  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
    Run Keyword If  '${status}'=='False'  Check For Third Option Leave Training
Leave Training Page
    FOR  ${i}  IN RANGE  0  5  1
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${first_leave_training_page}
    Run Keyword If  '${status}'=='True'  Click Element  ${first_leave_training_page}
    ...   ELSE IF  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
    Run Keyword If  '${status}'=='False'  Check For Second Leave Button Training
Submit New Label
    Wait Until Element Is Visible  ${submit_add_new_label}
    Click Element  ${submit_add_new_label}
Input New Label Example
    [Arguments]  ${example}
    Input Text  ${new_label_example_text_field}  ${example}
Input New Label Name
    [Arguments]  ${name}
    Input Text  ${new_label_name_text_field}  ${name}
Test Failsafe Skip
    Cleanup
    Skip
Press Main Add New Label
    Click Element  ${add_label_button}
Press Add New Label
    FOR  ${i}   IN RANGE  0  5  1
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${add_label_button}
    Run Keyword If  '${status}'=='True'  Press Main Add New Label
    ...   ELSE IF  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
    Run Keyword If  '${status}'=='False'  Check For Second Add Button

Check For Second Add Button
    FOR  ${i}   IN RANGE  0  5  1
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${other_add_label_button}
    Run Keyword If  '${status}'=='True'  Click Element  ${other_add_label_button}
    ...   ELSE IF  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
    Run Keyword If  '${status}'=='False'  Check For Third Add Button
Check For Third Add Button
    FOR  ${i}   IN RANGE  0  5  1
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${third_option_add}
    Run Keyword If  '${status}'=='True'  Click Element  ${third_option_add}
    ...   ELSE IF  '${status}'=='False'  Reload Page
    Exit For Loop If  '${status}'=='True'
    END
    Run Keyword If  '${status}'=='False'  Test Failsafe Skip

Get Model Id
    Wait Until Element Is Visible  ${model_id}
    ${model_id_as_string}  Get Text  ${model_id}
    ${model_id_as_int}  remove_total_items_text  ${model_id_as_string}
    Set Global Variable  ${model_id_as_int}

Verify Add New Label Is Pressed
    Wait Until Element Is Visible  ${new_label_name_text_field}
    Wait Until Element Is Visible  ${new_label_example_text_field}

Verify Total Number Of Items Before Adding Label
    Wait Until Element Is Visible  ${total_items_text}
    ${total_items_as_string}  Get Text  ${total_items_text}
    ${total_items_as_int_before_increase}  remove_total_items_text  ${total_items_as_string}
    Set Global Variable  ${total_items_as_int_before_increase}
    Should Be True  ${total_items_as_int_before_increase} == 1285
Verify Total Number Of Items After Adding Label
    Wait Until Element Is Visible  ${total_items_text}
    ${total_items_as_string}  Get Text  ${total_items_text}
    ${total_items_as_int}  remove_total_items_text  ${total_items_as_string}
    Set Global Variable  ${total_items_as_int}
    Should Be True  ${total_items_as_int_before_increase} < ${total_items_as_int}
Go To Model Overview
    Wait Until Page Contains Element  ${click_pre-existing_model}
    Click Element   ${click_pre-existing_model}

Press Start Training Button
    Wait Until Element Is Visible  ${start_training_button}
    Click Element  ${start_training_button}

Go To Start Training Page
    Go To Model Overview
    Get Model Id
    Verify Total Number Of Items Before Adding Label
    Press Start Training Button

Add A Label To Model With Example
    Press Add New Label
    Verify Add New Label Is Pressed
    Input New Label Name  First
    Input New Label Example  First
    Submit New Label

Add Multiple Labels To Model With Example
    Press Add New Label
    Verify Add New Label Is Pressed
    Input New Label Name  First
    Input New Label Example  First
    Submit New Label
    Sleep  1s
    Press Add New Label
    Verify Add New Label Is Pressed
    Input New Label Name  Second
    Input New Label Example  Second
    Submit New Label
Add A Label To Model Without Example
    Press Add New Label
    Verify Add New Label Is Pressed
    Input New Label Name  First
    Submit New Label

Add Multiple Labels To Model Without Example
    Press Add New Label
    Verify Add New Label Is Pressed
    Input New Label Name  First
    Submit New Label
    Sleep  1s
    Press Add New Label
    Verify Add New Label Is Pressed
    Input New Label Name  Second
    Submit New Label

Verify Items Increase
    Leave Training Page
    Verify Total Number Of Items After Adding Label

Verify Items Did Not Increase
    Leave Training Page
    Verify Total Number Of Items Before Adding Label

A Support Ticket Model Is Created
    Create Support Ticket Demo Model
The User Is On "Start Training" Page
    Go To Start Training Page
The User Adds A Label Without Example
    Add A Label To Model Without Example

The User Adds Multiple Labels Without Example
    Add Multiple Labels To Model Without Example
The User Adds A Label With Example
    Add A Label To Model With Example

The User Adds Multiple Labels With Example
    Add Multiple Labels To Model With Example
The Model Should Not Increase "Total Items" And/Or "Labeled Items"
    Verify Items Did Not Increase
    Cleanup
The Model Should Increase "Total Items" And "Labeled Items"
    Verify Items Increase
    Cleanup




