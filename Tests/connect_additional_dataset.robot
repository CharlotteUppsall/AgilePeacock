*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/additionalDatasetResource.robot
Resource  ../Resources/mainResource.robot
Resource  ../Resources/createModelResource.robot
Resource  ../Resources/deleteModelResources.robot
Resource  ../Resources/resourceGate.robot
Library  ../Scripts/remove_text.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

User Can Confirm Button "Connect Additional Dataset" Visible On Model Overview
   [Documentation]  Given that a model has been created, When the model overview page is opened, Then connect additional datasets button shall be shown
   [Tags]  AG_56
   Login
   User Can Confirm Button "Connect Additional Dataset" Is Shown In Model Overview Page


User Can Confirm Connected Dataset Listed As Connected Datset On Model Overview
   [Documentation]  Given that the user is on the “Datasets available to connect” page, When Continue button for a dataset is clicked, Then the dataset is listed under Connected datasets on the model overview
   [Tags]  AG_56
   User Can Confirm Connected Dataset Listed As Connected Datset On Model Overview Page


Gherkin AG-88 And AG-91
   [Documentation]
   [Tags]  AG_56, AG-88, AG,91

   Given Login
   And Switch To Hello Workspace
   And Go To Model Overview on Pre-existing Model
   When Verify Button "Connect Additional Dataset"
   Then Verify Connected Dataset Is Listed Under Connected datasets


#User Can Delete Connected Dataset
#   [Documentation]  Diconnects the dataset that was used in test AG-91
#   [Tags]  AG_56
#   Disconnect Dataset
