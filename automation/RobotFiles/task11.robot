*** settings ***
Library           DatabaseLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           DataDriver      CSVData/invaliddata2.csv

suite setup     open authpage
suite teardown      close Browser
Test Template       authentification with name and email and password and checkedpassword

*** Variables ***
${Browser}       Chrome
${URL}           https://www.google.com

*** Test Cases ***
authentification with name ${nom} and email ${email} and password ${pass} and checkedpassword ${confPass}

*** Keywords ***

open authpage
    Open Browser    ${URL}     ${Browser}
    Input Text    xpath://*[@id="APjFqb"]  amazon
    Submit Form
    Wait Until Page Contains    amazon
    Maximize Browser Window
    Click Element    xpath://*[@id="rso"]/div[1]/div/div/div/div/div/div/div[1]/a/h3
    Click Element    id=nav-orders
    click link    id=createAccountSubmit


authentification with name and email and password and checkedpassword
    [Arguments]     ${nom}  ${email}  ${pass}  ${confPass}
    Set Selenium Speed	1 seconds
    input text  id=ap_customer_name  ${nom}
    input text  id=ap_email  ${email}
    input text  id=ap_password  ${pass}
    input text  id=ap_password_check  ${confPass}
    click button    id=continue

