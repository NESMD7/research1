*** settings ***
Documentation
Library           RequestsLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           CSVLibrary


*** Variables ***
${validdatacsvfile}      C:/Users/msi/PycharmProjects/pythonProject11/automation2/TestApi/CsvData/ValidDataUse.csv
${url}      http://localhost:8888

*** Keywords ***
Get Token
    @{userData}=    Read CSV File To List    ${validdatacsvfile}
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

