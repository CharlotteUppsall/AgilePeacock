*** Variables ***
${random}  random 


*** Keywords ***


#gherkin:

a single label dataset with the same labels as in the model is uploaded
    Login Jennifer
    Go To  https://app.labelf.ai/main/377/datasets/view
    Wait Until Page Contains  Dataset ID: 454
    Wait Until Page Contains  Dataset ID: 455

the user connects the new dataset from the model overview
    #Go To  https://app.labelf.ai/main/377/models/view
    Go To  https://app.labelf.ai/main/377/models/2999/dashboard/dashboard
    #store the number of items in a variable and compare

the total items and labled items are updated
