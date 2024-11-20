#Inthis file we will prepare helping keywords
*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    XML
Library    OperatingSystem
Library    RequestsLibrary
Resource    Keywords.resource
Resource    Locators.resource


*** Keywords ***
setup driver and path for chrome and open URL
    [Documentation]    setups the executable path and assigns the URL
    [Arguments]    ${URL}=${AmazonURL}    ${Driver path}=${ChromedriverPath}
    Open Browser   browser=Chrome    options= add_experimental_option("detach",True)
    Go To    ${URL}
    Maximize Browser Window

Get test data from XML
    [Documentation]    Collects test data from XML









Get test data from EXCEL
    [Documentation]    Collects test data from Excel




