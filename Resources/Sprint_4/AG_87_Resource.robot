*** Variables ***
${totalItems:149_HelaTExtenOchNumret}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]
${totalItems:149}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]/text()
${labeledItems:149}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[3]/text()
${DatasetID445Continue}  //*[@id="app"]/div[5]/div/div/div/div[3]/div/div/div[1]/div/div/div/div[2]/button/div
${455_connect}  //*[@id="app"]/div[5]/div/div/div/div[5]/div/div/div[3]/button/div
${connectAdditionalDatasetButtonJennifer}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[6]/div/div[3]/nav/div/span/button/div
${totalItems:300}  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]


*** Keywords ***

#gherkin:

a single label dataset with the same labels as in the model is not yet connected
    Login Jennifer
    Go To  https://app.labelf.ai/main/377/datasets/view
    Wait Until Page Contains  Dataset ID: 454
    Wait Until Page Contains  Dataset ID: 455
    Go To  https://app.labelf.ai/main/377/models/2999/dashboard/dashboard
    Verify Current Number Of Total Items

the user connects the new dataset from the model overview
    Go To  https://app.labelf.ai/main/377/models/2999/dashboard/dashboard
    Wait Until Page Contains  Model ID: 2999
    User Clicks On The "Connect Additional Dataset"-Button 2
    The Continue Button For Dataset With ID 455 Is Clicked
    User Clicks On The Connect Button For Dataset With ID 455
    #store the number of items in a variable and compare

the total items and labled items are updated
    Reload Page
    Wait Until Page Contains  Total items:
    Verify Updated Number Of Total Items After An Additional Dataset Has Been Connected

#-----------------------------------------------------------------------------------------

Verify Updated Number Of Total Items After An Additional Dataset Has Been Connected
   Reload Page
   Sleep  10s
   Wait Until Page Contains  Total items:
   ${element_text2}  Get Text  ${totalItems:300}
   ${actual_number2}  transfigure into number  ${element_text2}
   Should not be true  ${actual_number2}  == 149

Verify Current Number Of Total Items
   Reload Page
   Sleep  10s
   Wait Until Page Contains  Total items:
   ${element_text}  Get Text  //*[@id="app"]/div[7]/div[1]/main/div/div/div[2]/div/div[1]/div/div[2]/div/div/p[2]
   ${actual_number}  transfigure into number  ${element_text}
   Should be true  ${actual_number}  == 149




User Clicks On The "Connect Additional Dataset"-Button 2
    Reload Page
    Execute Javascript  window.scrollTo(0,1900)
    Scroll Element Into View  ${connectAdditionalDatasetButtonJennifer}
    Sleep  5s
    Click Element  ${connectAdditionalDatasetButtonJennifer}
    Wait Until Page Contains  Datasets available to connect

The Continue Button For Dataset With ID 455 Is Clicked
    Wait Until Element Is Visible  ${DatasetID445Continue}
    Click Element  ${DatasetID445Continue}
    Wait Until Page Contains   Please click on the column containing the text you want to classify

User Clicks On The Connect Button For Dataset With ID 455
    Scroll Element Into View  ${455_connect}
    Wait Until Element Is Visible  ${455_connect}
    Click Element  ${455_connect}
    #Wait Until Page Contains  Dataset ID: 455
    Wait Until Page Contains  Connected Datasets


