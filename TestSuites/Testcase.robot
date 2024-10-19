*** Settings ***
Resource    ../resource/Resource.resource
*** Test Cases ***
Automate the Amazon shopping page
    [Documentation]  Automate the Amazon shopping page and places Order
    [Tags]    TC01
    Open Browser with Amazon URL
    Login to the Flipkart
    #Search for the Product
    #filter product according to the user
    #Select Product as per the userdata
    Download and verify the bill


    

