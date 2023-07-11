*** settings ***
Library           DatabaseLibrary
Library           OperatingSystem
Library           Selenium2Library

suite setup     open authpage
suite teardown      close Browser

*** Variables ***
${Browser}       Chrome
${URL}           https://www.google.com

*** Test Cases ***
valid authentification
    input text  id=ap_customer_name  nesrine
    input text  id=ap_email  msaedn12@gmail.com
    input text  id=ap_password  333333
    input text  id=ap_password_check  333333
    click button    id=continue

    Execute Javascript   window.open('www.google.com');
    Sleep   30

*** Keywords ***

open authpage
    Open Browser    ${URL}     ${Browser}
    Input Text    xpath://*[@id="APjFqb"]  amazon
    Submit Form
    Wait Until Page Contains    amazon
    Maximize Browser Window
    Click Element    xpath://a[contains(@href, 'amazon') and .//h3]
    Click Element    id=nav-orders
    click link    id=createAccountSubmit




