*** Settings ***
Resource    Resource.resource


*** Variables ***

${DefaultWaitTime}        3
${ChromedriverPath}    E:\Learning\PycharmProjects\RobotFramework\config\chromedriver
${FlipkartURL}        https://www.flipkart.com/
*** Keywords ***

Wait and Click
    [Arguments]    ${Xpath}
    Wait Until Page Contains Element    ${Xpath}
    Click Element    ${Xpath}
    
Wait and Input 
    [Arguments]    ${Xpath}
    Wait Until Page Contains Element    ${Xpath}
    Input Text    ${Xpath}    ${text}

setup driver and path for chrome and open URL
    [Documentation]    setups the executable path and assigns the URL
    [Arguments]    ${URL}=${FlipkartURL}    ${Driver path}=${ChromedriverPath}
    Open Browser   browser=Chrome    options= add_experimental_option("detach",True)
    Go To    ${URL}
    Maximize Browser Window

Open Browser with Amazon URL
    [Documentation]    Opens the Amazon URL
    [Arguments]    ${URL}=${FlipkartURL}
    setup driver and path for chrome and open URL    ${URL}

Login to the Flipkart
    [Documentation]    Opens the Amazon URL
    #[Arguments]    ${Username}    ${Password}
    Wait And Click    //a[@title='Login']/span
    Input Text    //input[@class='r4vIwl BV+Dqf']    8247649002
    Wait and Click    //button[contains(text(),'Request OTP')]
    Sleep    20

Search for the Product
    Input Text   xpath=//input[@title='Search for Products, Brands and More']        Apple iPhone 13 (128GB) - Midnight
    Capture Page Screenshot    Elementsearched.png
    Wait Until Page Contains Element    //div[@class='left-pane-results-container']
    Wait and Click        (//div[contains(text(),'apple iphone 13 128gb - midnight')])[1]

filter product according to the user
    Set Selenium Implicit Wait    10
    Wait Until Page Contains Element    ${StorageSizeLoc}
    Scroll Element Into View            ${StorageSizeLoc}
    ${ele}    Get Webelement            ${StorageSizeLoc}
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}
    Wait And Click    //span[contains(text(),'Apple iPhone 13 (256GB) - Midnight')]
    Get Window Titles
    ${handles}=    Get Window Handles
    Switch Window	${handles}[1]
    Wait Until Page Contains Element    //h1[@id='title']/span[contains(text(),'Apple iPhone 13 (256GB) - Midnight')]
    Capture Page Screenshot    Products seen.png
    ${FetchPrice}    Get Element Text    //div[@id='corePriceDisplay_desktop_feature_div']/div/span/span/span[@class='a-price-whole']


    

Download and verify the bill
    [Documentation]    Downloads and verify the bill for older orders
    Set Selenium Implicit Wait    10
    Mouse Over    //div[contains(text(),'partha')]
    Wait And Click    //a[@title='Orders']
    @{allOrders}     Get WebElements        //div[@class='col-8-12']
    For    ${element} in  @{allOrders}:
        ${text}    Get Element Text    ${element}
        Log To Console   ${text}


    
