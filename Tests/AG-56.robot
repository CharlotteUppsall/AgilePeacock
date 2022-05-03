*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Library  ../Scripts/remove_text.py
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

#User Log In
 #   [Documentation]  Test that will insert credentials, log in and go to the start page.
  #  [Tags]  AG_16
   # Login

#Prepare Add Model To WorkSpace for testing
 #   Create Support Ticket Demo Model



Datasets available to connect are displayed for the user
    [Documentation]  Test verifies uploaded datasets are present in the "My Datsets" list
    [Tags]  AG_89
    Given a dataset is uploaded
    And the dataset isn't connected to the model
    And user is on the model overview page
    When user clicks on the "connect additional dataset"-button
    Then the dataset is displayed in the "My Datasets"-list



   # herkin AG-88 And AG-91
   #[Documentation]
   #[Tags]  AG_56, AG-88, AG,91
  # Given Login
  # And Switch To Hello Workspace
   #And Go To Model Overview on Pre-existing Model
   #When Verify Button "Connect Additional Dataset"
 #  And  Steps In Connect Additional Dataset
  # Then Verify Connected Dataset Is Listed Under Connected Datasets
