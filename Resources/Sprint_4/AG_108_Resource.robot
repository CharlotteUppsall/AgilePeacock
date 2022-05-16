*** Variables ***
${AddToWorkspace}  //*[@id="app"]/div[4]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button/div
${Overview}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${MyDatasets(x)}  //*[@id="app"]/div[9]/div[1]/main/div/div/nav[1]/div/div[1]
${Overview220516}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[1]
${connectAdditionalDatasetButton220506}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
${DatasetContinueBotton220506}  //*[@id="continue-dataset-card"]/div
${connect220506}  //*[@id="connect-button"]/div

*** Keywords ***

a dataset has been uploaded
   Login
   Go To  https://app.labelf.ai/main/375/datasets/view
   Wait Until Page Contains  My Datasets
   ${element_text_myDatasets}  Get Text  ${MyDatasets(x)}
   ${actual_number_Of_Datasets}  remove_mydatasetstext_convert_into_number  ${element_text_myDatasets}
   Should be true  ${actual_number_Of_Datasets}  > 0

the dataset is connected to a model
    Add Demo Model To Workspace
    Connect The Dataset To The Model


model shall be in state Processing
    # här har Oskar färdig kod att klistra in

#--------------------------------------------------------------------

Run Keyword Until Success
    [Arguments]    ${KW}      @{KWARGS}
    Wait Until Keyword Succeeds    10s      1s     ${KW}      @{KWARGS}

Add Demo Model To Workspace
    Go To  https://app.labelf.ai/main/375/models/upload
    Wait Until Page Contains Element   ${AddToWorkspace}
    Click Element  ${AddToWorkspace}
    Wait Until Page Contains Element  ${Overview220516}
    Run Keyword Until Success     Click Element      ${Overview220516}

Connect The Dataset To The Model
    Execute Javascript  window.scrollTo(0,1500)
    Wait Until Page Contains Element  ${connectAdditionalDatasetButton220506}
    Run Keyword Until Success     Click Element      ${connectAdditionalDatasetButton220506}
    Wait Until Page Contains  Datasets available to connect
    Wait Until Page Contains Element  ${DatasetContinueBotton220506}
    Run Keyword Until Success     Click Element      ${DatasetContinueBotton220506}
    Wait Until Page Contains   Please click on the column containing the text you want to classify
    Scroll Element Into View  ${connect220506}
    Wait Until Element Is Visible  ${connect220506}
    Run Keyword Until Success     Click Element      ${connect220506}
    Wait Until Page Contains   Connected Datasets