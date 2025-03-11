*** Settings ***
Library     Browser    #https://marketsquare.github.io/robotframework-browser/Browser.html
Library     Collections
Library     String
Library     BuiltIn 
Library     DateTime
Variables   TestData/Register_Subscriber.yaml
Variables   TestData/login.yaml

# Variables
Resource    Resources/Variables/Variables_Common.robot
# Locators
Resource    Resources/Locators/Locator_Login.robot   
Resource    Resources/Locators/Register_Subscriber.robot  
# Keywords
Resource    Resources/Keywords/preparedata.robot
Resource    Resources/Keywords/Common.robot
Resource    Resources/Keywords/Common_DB.robot
Resource    Resources/Keywords/Login.robot
Resource    Resources/Keywords/Register_Subscriber.robot