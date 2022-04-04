*** Variables ***
${newModelButton}  //*[@id="app"]/div[6]/div[1]/main/div/div/div[1]/nav/div[1]/a
${continueButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[1]/div/div/div[2]
${chooseDataSetButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[2]/div/div[3]/div/div[1]/div/div/div[2]/button
${uploadPageContinue}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/div[2]/button
${inputNametextField}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[1]/div/div/div[1]/div/div/div[1]/div/input
${modelName}  TestModel
${createModelButton}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[4]/div/form/div[2]/button
*** Keywords ***
Verify Created Model
    Wait Until Page Contains  ${modelname}
Create Model
    Wait Until Page Contains Element  ${newmodelbutton}
    Click Element  ${newmodelbutton}
    Wait Until Page Contains Element  ${continuebutton}
    Click Element  ${continuebutton}
    Wait Until Page Contains Element  ${choosedatasetbutton}
    #Sleep  5s
    Click Button  ${choosedatasetbutton}
    Wait Until Page Contains Element  ${uploadpagecontinue}
    #sleep  5s
    Click Element  ${uploadpagecontinue}
    Wait Until Page Contains Element  ${inputnametextfield}
    #sleep  5s
    Clear Element Text  ${inputnametextfield}
    Input Text  ${inputnametextfield}  ${modelname}
    Click Element  ${createmodelbutton}
   # sleep  5s
    Verify Created Model



