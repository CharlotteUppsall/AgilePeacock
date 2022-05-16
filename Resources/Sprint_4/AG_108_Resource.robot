*** Variables ***
${AddToWorkspace}  //*[@id="app"]/div[4]/div/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/button/div
${Overview}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${MyDatasets(x)}  //*[@id="app"]/div[9]/div[1]/main/div/div/nav[1]/div/div[1]
${Overview220516}  //*[@id="model-card-title"]/a


*** Keywords ***

#gherkin:
#a single label dataset with the same labels as in the model is not yet connected
#    Login Jennifer
#    Go To  https://app.labelf.ai/main/377/datasets/view
#    Wait Until Page Contains  Dataset ID: 454
#    Wait Until Page Contains  Dataset ID: 455
#    Go To  https://app.labelf.ai/main/377/models/2999/dashboard/dashboard
#    Verify Current Number Of Total Items ### """""


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
    #User Clicks On The "Connect Additional Dataset"-Button
    #The Continue Button For A Dataset Is Clicked
    #User Clicks On The Connect Button

model shall be in state Processing

#--------------------------------------------------------------------
Add Demo Model To Workspace
    Go To  https://app.labelf.ai/main/375/models/upload
    #Reload Page
    #Sleep  5s
    Wait Until Page Contains Element   ${AddToWorkspace}
    Click Element  ${AddToWorkspace}
    #Reload Page
    #Sleep  5s
    Wait Until Page Contains Element  ${Overview220516}
    Click Element  ${Overview220516}

Connect The Dataset To The Model
#User Clicks On The "Connect Additional Dataset"-Button
    Execute Javascript  window.scrollTo(0,1500)
    Scroll Element Into View  ${connectAdditionalDatasetButton}
    Click Element  ${connectAdditionalDatasetButton}
    Wait Until Page Contains  Datasets available to connect

#The Continue Button For A Dataset Is Clicked
    Wait Until Element Is Visible  ${TestDatasetContinueBotton}
    Click Element  ${TestDatasetContinueBotton}
    Wait Until Page Contains   Please click on the column containing the text you want to classify

    #User Clicks On The Connect Button
    User Clicks On The Connect Button
    Scroll Element Into View  ${button_connect}
    Wait Until Element Is Visible  ${button_connect}
    Click Element  ${button_connect}