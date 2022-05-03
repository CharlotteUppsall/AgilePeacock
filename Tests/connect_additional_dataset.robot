*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Library  ../Scripts/remove_text.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

# User Can Confirm Button "Connect Additional Dataset" Visible On Model Overview
#   [Documentation]  Given that a model has been created, When the model overview page is opened, Then connect additional datasets button shall be shown
#   [Tags]  AG_56
#   Login
#   User Can Confirm Button "Connect Additional Dataset" Is Shown In Model Overview Page


# User Can Confirm Connected Dataset Listed As Connected Datset On Model Overview
#   [Documentation]  Given that the user is on the “Datasets available to connect” page, When Continue button for a dataset is clicked, Then the dataset is listed under Connected datasets on the model overview
#   [Tags]  AG_56
#   User Can Confirm Connected Dataset Listed As Connected Datset On Model Overview Page

User Login
   [Documentation]   Login function
   [Tags]  AG_16

User Function Connect Addittonal Dataset
   [Documentation]   Child Issue AG-88 And AG-91
   [Tags]  AG_56

   Given Switch To Hello Workspace
   And Go To Model Overview on Pre-existing Model

   When Verify Button "Connect Additional Dataset"

   Then Verify Connected Dataset Is Listed Under Connected Datasets


#User Can Delete Connected Dataset
#   [Documentation]  Diconnects the dataset that was used in test AG-91
#   [Tags]  AG_56
#   Disconnect Dataset
