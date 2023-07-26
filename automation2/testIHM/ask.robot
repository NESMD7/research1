*** Settings ***
Resource          login.robot

Library           OperatingSystem
Library           SeleniumLibrary

*** Variables ***
${projectPath}      C:/Users/n.msaed/PycharmProjects/pythonProject
${url}=     https://assistance.orange.sn/questions/1893163-arrive-acceder-requete-220-cause
${Browser}=     Chrome

*** Test Cases ***

ask question
    open website
    Click Link      xpath://*[@id="main-links"]/a
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath://*[@id="yui-main"]/div/div[2]/div[1]/div/h2
    Run Keyword If    ${present}    Login
    ${currenturl}=   Get Location
    sleep   5
    verif if Login has passed   ${currenturl}
    Close Browser Session

*** Keywords ***
