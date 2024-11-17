*** Settings ***
Resource    ../resource/Resource.resource

*** Variables ***
${BaseURL}    https://rahulshettyacademy.com/

*** Test Cases ***
Lets Practice the Dictionary
    [Documentation]    we will Practice about the Dictionaries
    [Tags]    Dict_01
    &{EmpData}=    Create Dictionary    name=Partha    Org=Techm    Exp=3Years    Website=rahulshettyacademy.com
    Dictionary should Contain Key    ${EmpData}    name
    Log To Console    ${EmpData}
    Log    ${EmpData}[Org]
    ${Result}=    Get From Dictionary     ${EmpData}    Org
    Log    ${Result}

Add Book in the Library Database
    [Documentation]    Add Book in the Library Database
    [Tags]    API_01
    &{ReqBody}=    Create Dictionary    name=Partha    BookNum=08564    pagecount=12852    Website=rahulshettyacademy.com
    POST    ${BaseURL}/Library/Addbook.php    json=${ReqBody}        expected_status=200
    
    


    