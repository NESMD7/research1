*** settings ***
Documentation
Library           RequestsLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           CSVLibrary

Resource       Token.robot
*** Variables ***
${url}      http://localhost:8888
*** Test Cases ***


acces reussie a un url securise avec le token d'authentification
     ${token}=       Get Token
     Log To Console      ${token}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
     ${resp}=            GET  ${url}/users       headers=${headers}
     Status Should Be    200        ${resp}
     Log To Console      ${resp}


*** Keywords ***
