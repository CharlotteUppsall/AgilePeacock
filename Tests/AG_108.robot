*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resourceGate.robot
Library  ../Scripts/remove_text.py
Library  ../Scripts/removeMyDatasets().py
Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Test Cases ***

Model Marked As Processing
    [Documentation]  The test will verify that the model is marked as processing right after a dataset has been connected
    [Tags]  AG-108  AG_114
    Given a dataset has been uploaded
    When the dataset is connected to a model
   # Then model shall be in state Processing
