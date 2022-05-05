*** Settings ***
Resource  ./Sprint_1/mainResource.robot
Resource  ./Sprint_1/deleteModelResources.robot
Resource  ./Sprint_1/createModelResource.robot
Resource  ./Sprint_2/confirmDisabledResource.robot
Resource  ./Sprint_2/confirmSetupResource.robot
Resource  ./Sprint_2/createLabelResource.robot
Resource  ./Sprint_2/labelsShownResource.robot
Resource  ./Sprint_2/select_column_resources.robot

Resource  ./Sprint_3/connectAdditionalDatasetResource.robot



Resource  ./Sprint_3/AG-95_resource.robot

Resource  ./Sprint_3/AG-52-Resource.robot
Library  ../Scripts/remove_text.py
Library  ../Scripts/remove_comma.py
Library  ../Scripts/remove_total_items_text.py

