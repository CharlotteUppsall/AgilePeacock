*** Variables ***
${button_slider}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div
${button_slider_off}  //*[@id="app"]/div[2]/div/div/div[2]/div/div[3]/div/div/nav/div/div[3]/div[2]/div[1]/div/div[1]
${password}  123456789
${Main_Page}

*** Keywords ***
Start New Model
    Press Create New Model
    Press Continue To Model Creation
    Press Dataset Button
    Wait Until Element Is Visible   ${button_slider}

Train Directly[...] Function Active To Disabled

   Click Element At Coordinates  ${button_slider_off}  5  0

Verify Slide Button Is Disabled
   Wait Until Page Contains   Name your model

Confirm Text Has Changed When Function Disabled

   Train Directly[...] Function Active To Disabled
   Verify Slide Button Is Disabled

that “Train directly on labels from an existing column” has been selected
    Wait Until Page Contains  Please click on the column containing the text you want to classify
the slider is set to disabled
    Train Directly[...] Function Active To Disabled
the column select step shall be removed from the setup steps
    Verify Slide Button Is Disabled
    Go Back


