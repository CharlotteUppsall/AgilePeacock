*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/mainResource.robot
Resource  ../Resources/additionalDatasetResource.robot
Resource  ../Resources/createModelResource.robot
Resource  ../Resources/deleteModelResources.robot
Library  ../Scripts/remove_text.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

AG_88 User Can Confirm Button "Connect Additional Dataset" Is Shown In Model Overview Page
   [Documentation]  Given that a model has been created, When the model overview page is opened, Then connect additional datasets button shall be shown
   [Tags]  AG_56

   Login
   # Create Model - behövs?


AG_91 User Can Confirm The Connected Dataset Is Listed Under Connected Datset On Model Overview Page
   [Documentation]  Given that the user is on the “Datasets available to connect” page, When Continue button for a dataset is clicked, Then the dataset is listed under Connected datasets on the model overview
   [Tags]  AG_56

