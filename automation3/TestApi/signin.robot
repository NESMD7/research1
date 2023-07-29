*** settings ***
Documentation
Library           RequestsLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           CSVLibrary


*** Variables ***
${invaliddatacsvfile}       C:/Users/msi/PycharmProjects/pythonProject11/automation2/TestApi/CsvData/invalidUserData.csv
${validdatacsvfile}      C:/Users/msi/PycharmProjects/pythonProject11/automation2/TestApi/CsvData/ValidDataUse.csv
${url}      http://localhost:8888

*** Test cases ***
SuccessfullyLogin
    [Documentation]        faire un signIn avec valid userdata deja authentifié , et retourne un token , expected  response :200

    @{userData}=    Read CSV File To List    ${validdatacsvfile}
    Log To Console    ${userData}
        ${userName}         Set Variable    ${userData[0][0]}
        ${userPassword}     Set Variable    ${userData[0][3]}


        ${body}=            Create Dictionary  userName=${userName}   userPassword=${userPassword}
        Log To Console      ${body}

        ${resp}=            POST  ${url}/authenticate  json=${body}

        Status Should Be    200                   ${resp}
        Log To Console      ${resp}




Failed Login
    [Documentation]       Signin failed a cause des donnees manquante username or password , expected response : 401 Unautorise

    @{userData}=    Read CSV File To List    ${invaliddatacsvfile}
    FOR     ${row}  IN       @{userData}
        ${userName}         Set Variable    ${row[0]}
        ${userPassword}     Set Variable    ${row[1]}

        Log To Console      ${row}

        ${body}=            Create Dictionary  userName=${userName}   userPassword=${userPassword}

        ${resp}=            POST  ${url}/authenticate  json=${body}
     END
        Status Should Be    ${resp}    401

