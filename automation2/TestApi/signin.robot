*** settings ***
Documentation
Library           RequestsLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           CSVLibrary


*** Variables ***
${invaliddatacsvfile}       C:/Users/msi/PycharmProjects/pythonProject11/automation2/CsvData/invalidUserData.csv
${csvfile}      C:/Users/msi/PycharmProjects/pythonProject11/automation2/CsvData/ValidDataUse.csv
${url}      http://localhost:8888

*** Keywords ***
SuccessfullyLogin
    [Documentation]        faire un signIn avec valid userdata deja authentifié , et retourne un token , expected  response :200
    Get Token

Get Token
    @{userData}=    Read CSV File To List    ${csvfile}
    FOR     ${row}  IN       @{userData}
        ${userName}         Set Variable    ${row[0]}
        ${userPassword}     Set Variable    ${row[3]}

        Log To Console      ${row}

        ${body}=            Create Dictionary  userName=${userName}   userPassword=${userPassword}
        Log To Console      ${body}

        ${resp}=            POST  ${url}/authenticate  json=${body}

        Status Should Be    200                   ${resp}
        Log To Console      ${resp}
        ${token}=       Set Variable        ${resp.json()['jwtToken']}
    END
    [return]     ${token}


