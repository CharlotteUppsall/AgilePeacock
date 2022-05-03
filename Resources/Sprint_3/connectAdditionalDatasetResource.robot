*** Variables ***
${shutDownTheGreenLoggedInButton}  //*[@id="app"]/div[7]/div[2]/div/div/div/button/div
${DatasetsViewButton}  //*[@id="app"]/div[6]/div[1]/nav/div/a[2]
${ModelsViewButton}  //*[@id="app"]/div[9]/div[1]/nav/div/a[1]
${ModelOverviewButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[3]/div/div/div/div/div/div[2]/a
${connectAdditionalDatasetButton}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button
${continueWithPickedDatasetButton}  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div[3]/div/div/div[2]/button
${connectButton}  //*[@id="app"]/div[4]/div/div/div/div[5]/div/div/div[3]/button
${MenyButton1}  //*[@id="app"]/div[6]/div[1]/nav/div/div[3]/div/button
${MenyButton2}  //*[@id="app"]/div[7]/div[1]/nav/div/div[3]/div/button
${MenyDatasetButton1}  //*[@id="app"]/div[3]/div/div[1]/div[4]/a/div[1]/div
${MenyDatasetButton2}  //*[@id="app"]/div[3]/div/div[1]/div[4]/a
${MenyDatasetButton3}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a
${MenyDatasetButton4}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[1]/div
${MenyDatasetButton5}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[1]
${MenyDatasetButton6}  //*[@id="app"]/div[4]/div/div[1]/div[4]/a/div[2]

${MyDatasetsText}   //*[@id="app"]/div[9]/div[1]/main/div/div/nav[1]/div/div[1]
#för att få bort meny-rullgardinen, ifall det behövs

*** Keywords ***

a dataset is uploaded
    Sleep  10s
    Wait Until Page Contains Element  ${MenyButton2}
    Click Element  ${MenyButton2}
    Sleep  5s
    Click Element  ${MenyDatasetButton3}
    Wait Until Page Contains  My Datasets (4)
    # pga det skall finnas fyra dataset

the dataset isn't connected to the model
    Click Element  ${ModelsViewButton}
    Wait Until Page Contains  My Models
    Sleep  5s
    Wait Until Page Contains  support ticket routing model
    Click Element  ${ModelOverviewButton}
    Wait Until Page Contains  Name
    Execute Javascript  window.scrollTo(0,1500)
    Scroll Element Into View  ${connectAdditionalDatasetButton}
    Wait Until Page Contains  Connected Datasets
    Page Should Not Contain  Dataset for testing
# pga det dataset som inte skall vara connected heter "Dataset for testing"

user is on the model overview page
    Page Should Contain Button  ${connectAdditionalDatasetButton}
# Testet har redan navigerat till sidan

user clicks on the "connect additional dataset"-button
    Scroll Element Into View  ${connectAdditionalDatasetButton}
    Click Element  ${connectAdditionalDatasetButton}
    Wait Until Page Contains  Datasets available to connect

the dataset is displayed in the "My Datasets"-list
    Wait Until Page Contains  My Datasets
    Wait Until Page Contains  Dataset for testing
# pga mitt uppladdade dataset som ska finnas i listan heter "Dataset for testing"

