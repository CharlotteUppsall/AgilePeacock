*** Variables ***
${password}  123456789
${button_connectAdditionalDataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
${continueButton_id}   //*[@id="continue-dataset-card"]/div
${connectButton_id}   //*[@id="connect-button"]/div
${closeWindow}   //*[@id="app"]/div[4]/div/div/nav/div/button/div/i
${disconnectDataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/span/button/div
${confirmDisconnect}   //*[@id="app"]/div[4]/div/div/div[3]/button[2]/div

# disconnect knapp aktiv     //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/span/button/div
${disconnect-knapp-låst}   //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/span/span[1]
${connect-additional-låst}    //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/span[1]
# coonect additonal aktiv    //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
*** Keywords ***

Verification Of AG-111
   Go To   https://app.labelf.ai/main/384/models/2931/dashboard/dashboard
   Reload Page
   Scroll Element Into View    ${button_connectAdditionalDataset}
#   Wait Until Element Is Visible    ${button_connectAdditionalDataset}
   Click Element   ${button_connectAdditionalDataset}
   Wait Until Page Contains   Pick a dataset to connect
   Wait Until Page Contains   Dataset ID: 344
   Click Element   ${continueButton_id}
   Wait Until Page Contains   Choose a column containg the text
   Scroll Element Into View  ${connectButton_id}
   Click Element   ${connectButton_id}
#   Wait Until Element Is Visible   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/p
#  Test dataset:  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/p
   Reload Page
#   Sleep   6s
#   go to dataset - ej process    //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/a/div
#   go to dataset - under process //*[@id="app"]/div[9]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/a/div
   Scroll Element Into View    ${disconnect-knapp-låst}
#   Scroll Element Into View   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/span/button/div    # disconnect knapp aktiv
   Wait Until Page Contains   Dataset ID: 344   # test rubrik  =  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/nav/div
#   Wait Until Element Is Visible   ${button_connectAdditionalDataset}
   Sleep   6s
   Reload Page
   Scroll Element Into View    ${button_connectAdditionalDataset}
#   Scroll Element Into View    ${disconnect-knapp-låst}
#   Wait Until Keyword Succeeds   6x    200ms   ${button_connectAdditionalDataset}
   Click Element   ${button_connectAdditionalDataset}
   Wait Until Page Contains   Pick a dataset to connect
   Page Should Not Contain   Dataset ID: 344    # verification AG-111
   Click Button    ${closeWindow}

# Wait Until Keyword Succeeds

Verification Of AG-117
   Wait Until Element Is Visiblie   ${disconnectDataset}
   Click Element   ${disconnectDataset}
   Wait Until Page Contains   This will completely remove your dataset and its contents from the model, are you sure?
   Click Element   ${confirmDisconnect}
   Sleep   3s
   Reload Page
   Wait Until Page Contains   Connected Datasets
   Page Should Not Contain   Dataset ID: 344    # verification AG-117


User Can Confirm AG-111-117
    Verification of AG-111
    Verification Of AG-117