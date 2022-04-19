*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
Resource  ../Resources/confirmDisabledResource.robot
Resource  ../Resources/createModelResource.robot
Resource  ../Resources/deleteModelResources.robot
Library  ../Scripts/remove_text.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***
User Can Confirm Change of Text For Step 3 When "Train Directly[...]" Is Disabled
  [Documentation]  When slider "Train directly on labels from an existing column” is disabled step 3 is changed to: Name your model
  [Tags]   AG_18

  Login
  Confirm Text Has Changed When Function Disabled