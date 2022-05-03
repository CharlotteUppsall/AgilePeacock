*** Variables ***
${shutDownTheGreenLoggedInButton}  //*[@id="app"]/div[7]/div[2]/div/div/div/button/div
${DatasetsViewButton}  //*[@id="app"]/div[6]/div[1]/nav/div/a[2]
${ModelsViewButton}  //*[@id="app"]/div[6]/div[1]/nav/div/a[1]/div
${ModelOverviewButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${connectAdditionalDatasetButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
${continueWithPickedDatasetButton}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[3]/div/div/div[2]/button
${connectButton}  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button
${MenyButton1}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button
${MenyButton2}  //*[@id="app"]/div[7]/div[1]/nav/div/div[3]/div/button
${MenyDatasetButton1}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[1]/div
${MenyDatasetButton2}  //*[@id="app"]/div[3]/div/div[1]/div[4]/a
${MenyDatasetButton3}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a
${MenyDatasetButton4}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[1]/div
${MenyDatasetButton5}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[1]
${MenyDatasetButton6}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[2]
${MyDatasetsText}   //*[@id="app"]/div[9]/div[1]/main/div/div/nav[1]/div/div[1]
${TestDatasetContinueBotton}  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button
${TestDatasetThatShouldntBeHere}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div


${password}  123456789
# ${Main_Page} # se om den behövs
${workspace_menu}   //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button/div/i
${workspace_menu2}   //*[@id="app"]/div[7]/div[1]/nav/div/div[3]/div/button/div/i
${workspace_hello}   //*[@id="app"]/div[3]/div/div[2]/div[5]/a/div[1]/div
${workspace_hello2}   //*[@id="app"]/div[4]/div/div[2]/div[5]/a/div[1]/div
${pre_existing_model_overview}   //*[@id="app"]/div[8]/div[1]/main/div/div/div[3]/div/div[1]/div/div/div/div[2]/a/div
${existing_model_overview}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a/div
${model_overview_button}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[1]/div/div/div/div/nav/div/a[3]/div
${connect_additional_dataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
${continue_select_dataset}   //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/div[2]/button/div
${continue_connect}   //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[1]/div/div/div[2]/button/div
${button_connect}   //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button/div
${scroll_to_dataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[1]/h4
${disconnect_dataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/span/button/div
${popUp_confirm_disconnect}    //*[@id="app"]/div[4]/div/div/div[3]/button[2]/div
${popUp_confirm_disconnect2}   //*[@id="app"]/div[3]/div/div/div[3]/button[2]/div

*** Keywords ***

a dataset is uploaded
# kollar att det finns ett dataset uppladdat under fliken "Datasets"
    Login
    Switch To Hello Workspace
    Sleep  2s
    Wait Until Page Contains Element  ${MenyButton2}
    Click Element  ${MenyDatasetButton1}
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