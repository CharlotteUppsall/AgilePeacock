*** Variables ***
${password}  123456789
${button_connectAdditionalDataset}   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div


*** Keywords ***

AG-111
   Go To   https://app.labelf.ai/main/384/models/2931/dashboard/dashboard
#  Scroll Element Into View    ${button_connectAdditionalDataset}
   Wait Until Element Is Visible    ${button_connectAdditionalDataset}
   Click Element   ${button_connectAdditionalDataset}
   Wait Until Page Contains   Pick a dataset to connect
   Wait Until Page Contains   Dataset ID: 344
   Click Element   //*[@id="continue-dataset-card"]/div
   Wait Until Page Contains   Choose a column containg the text
   Click Element   //*[@id="connect-button"]/div
#   Wait Until Element Is Visible   //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[2]/div/div/div/div/div/div[2]/p
#  Test dataset:  //*[@id="app"]/div[4]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/p
   Reload Page
   Sleep   10s
   Wait Until Page Contains    Dataset ID: 344
   Wait Until Element Is Visible    ${button_connectAdditionalDataset}
   Click Element   ${button_connectAdditionalDataset}
   Wait Until Page Contains   Pick a dataset to connect
   Page Should Not Contain    Dataset ID: 344    # Verifiation AG-111

# Wait Until Keyword

User Can Confirm AG-111
    AG-111