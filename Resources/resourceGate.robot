*** Settings ***
Resource  mainResource.robot
Resource  deleteModelResources.robot
Resource  confirmSetupResource.robot
Resource  createModelResource.robot
Library  ../Scripts/remove_text.py
Resource  createLabelResource.robot
Resource  confirmDisabledResource.robot
Resource  labelsShownResource.robot
Resource  select_column_resources.robot