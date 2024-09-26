*** Settings ***
Resource    Resource.resource
*** Keywords ***

Set Selenium Implicit Wait    10

Open Browser with Amazon URL
    [Documentation]    Opens the Amazon URL
    [Arguments]
    Open Browser    https://www.amazon.in/        chrome
    Maximize Browser Window


Search for the Product
    Input Text   xpath=//input[@id='twotabsearchtextbox']        soundbars
    Capture Page Screenshot    Elementsearched.png
    Wait Until Page Contains Element    //div[@class='left-pane-results-container']
    Wait and Click        (//div[contains(text(),'soundbars')])[1]

filter product according to the user
    Wait Until Page Contains Element    //span[contains(text(),'boAt')]/preceding-sibling::div/label/i
    ${ele}    Get Webelement      //span[contains(text(),'ZEBRONICS')]/preceding-sibling::div/label/input
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}

    Select Product as per the userdata
    [Arguments]

Wait and Click
    [Arguments]    ${Xpath}
    Wait Until Page Contains Element    ${Xpath}
    Click Element    ${Xpath}
    
