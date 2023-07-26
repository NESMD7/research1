*** Settings ***
Library           OperatingSystem
Library           SeleniumLibrary


*** Variables ***

*** Test Cases ***
Remplir Form subscribe
    Input Text      id=service      nesrine
    Input Text      id=slashcommunity_identity_firstname     msaed
    Input Text      id=slashcommunity_identity_custom_field_3     20852020
    Input Text      id=slashcommunity_identity_email     nesrinemsaed1@gmail.com
    Input Text      id=slashcommunity_identity_password     111111111
    Select Checkbox     id=slashcommunity_identity_tos
    Click Button        xpath://*[@id="new_slashcommunity_identity"]/fieldset/p/button/p/span

*** Keywords ***
