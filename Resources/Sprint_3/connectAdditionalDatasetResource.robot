*** Variables ***
${MenyButton}  //*[@id="app"]/div[7]/div[1]/nav/div/div[3]/div/button
${MenyDatasetButton}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[1]/div
${ModelsViewButton}  //*[@id="app"]/div[6]/div[1]/nav/div/a[1]/div
${ModelOverviewButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${connectAdditionalDatasetButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
${TestDatasetThatShouldntBeHere}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div
${workspace_menu}   //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/i
${workspace_hello}   //*[@id="app"]/div[3]/div/div[2]/div[5]/a/div[1]/div
${TestDatasetContinueBotton}  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button

*** Keywords ***

a dataset is uploaded
# kollar att det finns ett dataset uppladdat under fliken "Datasets"
    Login
    Switch To Hello Workspace
    Sleep  2s
    Wait Until Page Contains Element  ${MenyButton}
    Click Element  ${MenyDatasetButton}
    Sleep  2s
    Wait Until Page Contains  My Datasets (1)
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
    Element Should Be Visible  ${TestDatasetContinueBotton}

Switch To Hello Workspace
   Click Element  ${workspace_menu}
   Scroll Element Into View   ${workspace_hello}
   Click Element   ${workspace_hello}
   Wait Until Page Contains   Models | Hello1
  # ------------------------------------------------------------------------------


