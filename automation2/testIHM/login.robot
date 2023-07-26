*** Settings ***
Library           OperatingSystem
Library           SeleniumLibrary


*** Variables ***
${url}=     https://assistance.orange.sn/questions/1893163-arrive-acceder-requete-220-cause
${Browser}=     Chrome
${username}       nesrine
${password}       111111111
${Loginurl}    https://user-assistance.orange.sn/cas/login

*** Keywords ***
open website
    Open Browser    ${url}  ${Browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Login
    Input Text      id=username      ${username}
    Input Text      id=password     ${password}
    Click Button        xpath://*[@id="slashcommunity-login-form"]/fieldset/p/button
    Set Selenium Implicit Wait    5

verif if Login has passed
    [Arguments]       ${currenturl}
    Run Keyword If   '${Loginurl}' == '${currenturl}'      Log To Console      Login failed
    Run Keyword If   '${Loginurl}' != '${currenturl}'      Log To Console      Login passed



Close Browser Session
    Close Browser