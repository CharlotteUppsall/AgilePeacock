*** Variables ***

${MenyDatasetButton}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[1]/div
                      #//*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[1]/div
                      #//*[@id="app"]/div[1]/div/div[1]/div[4]/a
                      #//*[@id="app"]/div[1]/div/div[1]/div[4]/a/div[1]/div
                      #//*[@id="app"]/div[1]/div/div[1]/div[4]/a/div[2]
                      #//*[@id="app"]/div[1]/div/div[1]/div[4]/a/div[2]/i
${ModelsViewButton}  //*[@id="app"]/div[6]/div[1]/nav/div/a[1]/div
${ModelOverviewButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${connectAdditionalDatasetButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div

#${TestDatasetThatShouldntBeHere}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div
#${workspace_menu}   //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/i
${workspace_menu}   //*[@id="app"]/div[7]/div[1]/nav/div/div[3]/div/button/div/i
${workspace_hello}   //*[@id="app"]/div[3]/div/div[2]/div[5]/a/div[1]/div
${workspace_mySecondWorkspace}  //*[@id="app"]/div[4]/div/div[2]/div[4]/a/div[1]/div
${TestDatasetContinueBotton}  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button/div
${button_connect}   //*[@id="app"]/div[5]/div/div/div/div[5]/div/div/div[3]/button/div
${existing_model_overview}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${model_overview_button}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div
${continue_select_dataset}   //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/div[2]/button/div


# ------------------------------------------------------------------------------

${datapoints}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/span[2]
${demo_model_button}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button
${overview_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div
${connect_additional_datasets_button}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
${customer_support_continue}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/div[2]/button
${connect_datasets}  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
${datapoints_test}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/nav/div/span
${datapoints_cultural_centers_survey}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[2]/div/div/nav/div/span
${cultural_centers_survey_continue}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[2]/div/div/div[2]/button

${datapoints_increased}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/nav/div/span[2]

# ------------------------------------------------------------------------------

*** Keywords ***

# ------------------------------------------------------------------------------

A model has been created
    Login
    Switch To My Second Workspace
    Wait Until Page Contains  support ticket routing model (1)
    #Element Should Be Visible  ${ModelOverviewButton}  #kanske överflödig check, räcker med ovan

The model overview page is opened
   Reload Page
   Wait Until Page Contains Element  ${ModelOverviewButton}
   Click Element   ${ModelOverviewButton}
   Wait Until Page Contains Element    ${model_overview_button}
   Wait Until Page Contains  Name

Connect additional datasets button shall be shown
    Verify Button "Connect Additional Dataset"

Verify Button "Connect Additional Dataset"   # AG-88 Confirmation
   Execute Javascript  window.scrollTo(0,1500)
   Scroll Element Into View   ${connectAdditionalDatasetButton}
   Wait Until Page Contains Element   ${connectAdditionalDatasetButton}

Switch To My Second Workspace
   Click Element  ${workspace_menu}
   Scroll Element Into View   ${workspace_mySecondWorkspace}
   Click Element   ${workspace_mySecondWorkspace}
   Wait Until Page Contains   Models | My second workspace


#--------------------------------------------------------------------------

a dataset is uploaded
# kollar att det finns ett dataset uppladdat under fliken "Datasets"
    Reload Page
    #Wait Until Page Contains Element  //*[@id="app"]/div[7]/div[1]/nav/div/div[3]/div/button/div/i  #${workspace_menu}
    #Click Element  //*[@id="app"]/div[7]/div[1]/nav/div/div[3]/div/button/div/i  #${workspace_menu}
    #Wait Until Page Contains Element  ${MenyDatasetButton}
    #Click Element  ${MenyDatasetButton}
    Go To  https://app.labelf.ai/main/378/datasets/view
    Sleep  2s
    Wait Until Page Contains  My Datasets (1)   #kanske överflödig
    Wait Until Page Contains  Dataset ID: 438

the dataset isn't connected to the model
# kollar att det uppladdade datasetet inte redan är connected till vår modell
    Reload Page
    Wait Until Element Is Visible  ${ModelsViewButton}
    Click Element  ${ModelsViewButton}
    Wait Until Page Contains  My Models (1)
    Sleep  5s
    Wait Until Page Contains  support ticket routing model (1)
    Click Element  ${ModelOverviewButton}
    Wait Until Page Contains  Name
    Execute Javascript  window.scrollTo(0,1500)
    Scroll Element Into View  ${connectAdditionalDatasetButton}
    Wait Until Page Contains  Connected Datasets
    #Element Should Not Be Visible  ${TestDatasetThatShouldntBeHere}
    Current Frame Should Not Contain  DISCONNECT DATASET
# kollar att "test dataset elementet" inte finns med under "Connected Datasets"
#och som dubbelkoll kontrolleras att "disconnect dataset" inte finns (ska ej finnas ett dataset att disonnect)

user is on the model overview page
    Reload Page
    Wait Until Page Contains  Name
# Testet har redan navigerat till sidan

user clicks on the "connect additional dataset"-button
    Scroll Element Into View  ${connectAdditionalDatasetButton}
    Click Element  ${connectAdditionalDatasetButton}
    Wait Until Page Contains  Datasets available to connect

the dataset is displayed in the "My Datasets"-list  #Confirm AG_89
    Wait Until Page Contains  My Datasets
    Wait Until Page Contains  Dataset ID: 438
    Element Should Be Visible  ${TestDatasetContinueBotton}

# ------------------------------------------------------------------------------

The user is on the “Datasets available to connect” page
    #Reload Page
    #Scroll Element Into View  ${connectAdditionalDatasetButton}
    #Click Element  ${connectAdditionalDatasetButton}
    Wait Until Page Contains   Datasets available to connect  #redan navigerad till sidan



The Continue button for a dataset is clicked
    Wait Until Element Is Visible  ${TestDatasetContinueBotton}
    Click Element  ${TestDatasetContinueBotton}
    Wait Until Page Contains   Please click on the column containing the text you want to classify

User clicks on the connect button
    Scroll Element Into View  ${button_connect}
    Wait Until Element Is Visible  ${button_connect}
    Click Element  ${button_connect}

The dataset is listed under Connected datasets on the model overview  #Confirm AG_91
    Sleep   2s
    Wait Until Page Contains   Connected Datasets
    Wait Until Page Contains   Dataset ID: 438

#--------------------------------------------------------------------------

The User Has A Trained Model
    #Select Demo Model
    Verify Current Number Of Datapoints
    Go To Connect Additional Datasets

The User Connects An Additional Dataset
    Verify Number of Datapoints Second Dataset - Dataset ID: 438   #datasettet heter test men ID är tydligare
    # osäker på var verfieringen av datapoints sker... testa...
    Connect Additional Dataset
    Return To Models Page

The Number of Datapoints Displayed Under "My Models" Should Increase
    Verify Number Of Datapoints Increased
    #Delete Model


#Select Demo Model
#    Scroll Element Into View  ${demo_model_button}
#    Wait Until Element Is Visible  ${demo_model_button}
#    Click Element  ${demo_model_button}
#    Wait Until Page Contains  Agile Peacock

Verify Current Number Of Datapoints
    Sleep  5s
    Go To  https://app.labelf.ai/main/378/models/view
    Wait Until Element Is Visible  ${datapoints}
    ${datapoint_as_string}  Get Text  ${datapoints}
    ${datapoint_one_dataset}  remove comma and convert  ${datapoint_as_string}
    Set Global Variable  ${datapoint_one_dataset}
    Should Be True  ${datapoint_one_dataset} == 2784  #vi har redan connectat ett dataset därför bör det vara

Go To Connect Additional Datasets
    Click Element  ${ModelOverviewButton}
    Wait Until Page Contains  Test your model
    user clicks on the "connect additional dataset"-button
    #Scroll Element Into View  ${connect_additional_datasets_button}
    #Click Element  ${connect_additional_datasets_button}
    #Wait Until Page Contains  Pick a dataset to connect

Connect Additional Dataset
    User clicks on the connect button
    #Click Element  ${customer_support_continue}
    #Wait Until Page Contains  Please click on the column containing the text you want to classify
    #Scroll Element Into View  ${connect_datasets}
    #Click Element  ${connect_datasets}

Connect Cultural Centers Survey Dataset
    Click Element  ${cultural_centers_survey_continue}
    Wait Until Page Contains  Please click on the column containing the text you want to classify
    Scroll Element Into View  ${connect_datasets}
    Click Element  ${connect_datasets}

Return To Models Page
    Wait Until Page Contains  Connected Datasets
    Go To  https://app.labelf.ai/main/378/models/view
    Wait Until Page Contains  My Second Workspace

Verify Number of Datapoints Second Dataset - Dataset ID: 438
    Wait Until Element Is Visible  ${datapoints_test}
    ${datapoint_as_string_second_dataset}  Get Text  ${datapoints_test}
    ${datapoint_second_dataset}  remove comma and convert  ${datapoint_as_string_second_dataset}
    Set Global Variable  ${datapoint_second_dataset}
    Should Be True  ${datapoint_second_dataset} == 1500

Verify Number of Datapoints Second Dataset - Cultural Centers Survey
    Wait Until Element Is Visible  ${datapoints_cultural_centers_survey}
    ${datapoint_as_string_third_dataset}  Get Text  ${datapoints_cultural_centers_survey}
    ${datapoint_third_dataset}  Convert To Integer  ${datapoint_as_string_third_dataset}
    Set Global Variable  ${datapoint_third_dataset}
    Should Be True  ${datapoint_third_dataset} == 637

Verify Number Of Datapoints Increased
    Wait Until Element Is Visible  ${datapoints_increased}  #${datapoints}
    ${datapoint_as_string_two_datasets}  Get Text  ${datapoints_increased}  #${datapoints}
    ${datapoint_two_dataset}  remove comma and convert  ${datapoint_as_string_two_datasets}
    Should Be True  ${datapoint_two_dataset} <= ${datapoint_one_dataset}+${datapoint_second_dataset}
    Should Be True  ${datapoint_two_dataset} > ${datapoint_one_dataset}
    Should Be True  ${datapoint_two_dataset} > ${datapoint_second_dataset}

Verify Number Of Datapoints Increased - Cultural Centers Survey
    Wait Until Element Is Visible  ${datapoints}
    ${datapoint_as_string_two_datasets}  Get Text  ${datapoints}
    ${datapoint_two_dataset}  remove comma and convert  ${datapoint_as_string_two_datasets}
    Should Be True  ${datapoint_two_dataset} <= ${datapoint_one_dataset}+${datapoint_third_dataset}
    Should Be True  ${datapoint_two_dataset} > ${datapoint_one_dataset}
    Should Be True  ${datapoint_two_dataset} > ${datapoint_third_dataset}





#The User Has A Trained Model - 2
#    Press Create New Model
#    Select Demo Model
#    Verify Current Number Of Datapoints
#    Go To Connect Additional Datasets


#The User Connects An Additional Dataset - 2
#    Verify Number of Datapoints Second Dataset - Cultural Centers Survey
#    Connect Cultural Centers Survey Dataset
#    Return To Models Page


#The Number of Datapoints Displayed Under "My Models" Should Increase - 2
 #   Verify Number Of Datapoints Increased - Cultural Centers Survey
    #Delete Model