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
${MyDatasetsText}   //*[@id="app"]/div[9]/div[1]/main/div/div/nav[1]/div/div[1]
#för att få bort meny-rullgardinen, ifall det behövs

*** Keywords ***

a dataset is uploaded
    Sleep  10s
    Wait Until Page Contains Element  ${MenyButton2}
    Click Element  ${MenyButton2}


    #koden nedan ej fungerande pga dataset-knappen inte hittas...
    #Wait Until Page Contains  Datasets
    #Click Element  ${shutDownTheGreenLoggedInButton}
    #Wait Until Element Is Visible  ${DatasetsViewButton}
    #Click Element  ${DatasetsViewButton}
    #Wait Until Page Contains  Dataset for testing
    # pga det dataset som skall vara uppladdat heter "Dataset for testing"



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
    #Current Frame Should Not Contain
# pga det dataset som inte skall vara connected heter "Dataset for testing"

user is on the model overview page
    Page Should Contain Button  ${connectAdditionalDatasetButton}

user clicks on the "connect additional dataset"-button
    Scroll Element Into View  ${connectAdditionalDatasetButton}
    Click Element  ${connectAdditionalDatasetButton}
    Wait Until Page Contains  Datasets available to connect

the dataset is displayed in the "My Datasets"-list
    Wait Until Page Contains  My Datasets
    Wait Until Page Contains  Dataset for testing
# pga mitt uppladdade dataset som ska finnas i listan heter "Dataset for testing"

#Pick A Dataset To Connect
 #   Click Element  ${continueWithPickedDatasetButton}
  #  Scroll Element Into View  ${connectButton}
   # Click Element  ${connectButton}
    #Wait Until Page Contains  Connected Datasets




#går ej att disconnecta ett datasetm man redan connectat

#sidan skall inte innehålla: You haven't uploaded any datasets yet!
#kanske göra ett test som raderar dataset?
#och kollar att det inte finns i denna lista

