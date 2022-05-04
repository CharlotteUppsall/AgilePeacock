*** Variables ***
${MenyButton}  //*[@id="app"]/div[7]/div[1]/nav/div/div[3]/div/button
${MenyDatasetButton}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[1]/div
                      #//*[@id="app"]/div[1]/div/div[1]/div[4]/a
                      #//*[@id="app"]/div[1]/div/div[1]/div[4]/a/div[1]/div
                      #//*[@id="app"]/div[1]/div/div[1]/div[4]/a/div[2]
                      #//*[@id="app"]/div[1]/div/div[1]/div[4]/a/div[2]/i
${ModelsViewButton}  //*[@id="app"]/div[6]/div[1]/nav/div/a[1]/div
${ModelOverviewButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${connectAdditionalDatasetButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
${TestDatasetThatShouldntBeHere}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div
${workspace_menu}   //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/i
${workspace_hello}   //*[@id="app"]/div[3]/div/div[2]/div[5]/a/div[1]/div
${TestDatasetContinueBotton}  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button
${button_connect}   //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div

# ------------------------------------------------------------------------------

${existing_model_overview}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${model_overview_button}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div
${continue_select_dataset}   //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/div[2]/button/div
# med understreck är charlottes

*** Keywords ***

# ------------------------------------------------------------------------------

A model has been created
    Login
    Switch To Hello Workspace
    Wait Until Page Contains  support ticket routing model
    #Element Should Be Visible  ${ModelOverviewButton}  #kanske överflödig check, räcker med ovan

The model overview page is opened
   Reload Page
   Wait Until Page Contains Element  ${ModelOverviewButton}
   Click Element   ${ModelOverviewButton}
   Wait Until Page Contains Element    ${model_overview_button}   #kanske överflödig
   Wait Until Page Contains  Name

Connect additional datasets button shall be shown
    Verify Button "Connect Additional Dataset"

Verify Button "Connect Additional Dataset"   # AG-88 Confirmation
   Scroll Element Into View   ${connectAdditionalDatasetButton}
   Wait Until Page Contains Element   ${connectAdditionalDatasetButton}

Switch To Hello Workspace
   Click Element  ${workspace_menu}
   Scroll Element Into View   ${workspace_hello}
   Click Element   ${workspace_hello}
   Wait Until Page Contains   Models | Hello1


#--------------------------------------------------------------------------

a dataset is uploaded
# kollar att det finns ett dataset uppladdat under fliken "Datasets"
    #Login  - ta bort nu när allas test slås ihop
    #Switch To Hello Workspace
    #Sleep  2s
    Reload Page
    Wait Until Page Contains Element  ${MenyButton}
    Click Element  ${MenyButton}
    #Scroll Element Into View   ${MenyDatasetButton}
    Wait Until Page Contains Element  //*[@id="app"]/div[1]/div/div[1]/div[4]/a   #${MenyDatasetButton}
    Click Element  //*[@id="app"]/div[1]/div/div[1]/div[4]/a    #${MenyDatasetButton}
    Sleep  2s
    Wait Until Page Contains  My Datasets (1)   #kanske överflödig
    Wait Until Page Contains  Dataset ID: 344

the dataset isn't connected to the model
# kollar att det uppladdade datasetet inte redan är connected till vår modell
    Reload Page
    Wait Until Element Is Visible  ${ModelsViewButton}
    Click Element  ${ModelsViewButton}
    Wait Until Page Contains  My Models
    Sleep  5s
    Wait Until Page Contains  support ticket routing model
    Click Element  ${ModelOverviewButton}
    Wait Until Page Contains  Name
    Execute Javascript  window.scrollTo(0,1500)
    Scroll Element Into View  ${connectAdditionalDatasetButton}
    Wait Until Page Contains  Connected Datasets
    Element Should Not Be Visible  ${TestDatasetThatShouldntBeHere}
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

the dataset is displayed in the "My Datasets"-list
    Wait Until Page Contains  My Datasets
    Wait Until Page Contains  Dataset ID: 344
    Element Should Be Visible  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button/div  #${TestDatasetContinueBotton}

# ------------------------------------------------------------------------------

The user is on the “Datasets available to connect” page
    #Reload Page
    #Scroll Element Into View  ${connectAdditionalDatasetButton}
    #Click Element  ${connectAdditionalDatasetButton}
    Wait Until Page Contains   Datasets available to connect  #redan navigerad till sidan



The Continue button for a dataset is clicked   #when user attempts to connect...blabla
    Wait Until Element Is Visible  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button/div
    Click Element  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button/div  #${continue_select_dataset}
    Wait Until Page Contains   Please click on the column containing the text you want to classify

User clicks on the connect button
    Scroll Element Into View  //*[@id="app"]/div[5]/div/div/div/div[5]/div/div/div[3]/button/div    #${button_connect}
    Wait Until Element Is Visible  //*[@id="app"]/div[5]/div/div/div/div[5]/div/div/div[3]/button/div  #${button_connect}
    Click Element  //*[@id="app"]/div[5]/div/div/div/div[5]/div/div/div[3]/button/div  #${button_connect}

The dataset is listed under Connected datasets on the model overview
    Sleep   2s
    Wait Until Page Contains   Connected Datasets
    Wait Until Page Contains   Dataset ID: 344

#--------------------------------------------------------------------------