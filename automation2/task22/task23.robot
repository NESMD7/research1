*** settings ***
Library           DatabaseLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           CSVLibrary
Library           DateTime



suite setup      Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}



*** Variables ***
${DBHost}         localhost
${DBName}         task22db
${DBPass}
${DBPort}         3306
${DBUser}         root

${pathTC1}    C:/Users/n.msaed/PycharmProjects/pythonProject/automation2/task23/csvFiles1/
${pathTC2}    C:/Users/n.msaed/PycharmProjects/pythonProject/automation2/task23/csvFiles2/

*** test cases ***
create new csvfile Based on number of file in csvDirectory
    [Documentation]     chaque fois on execute le test, creation d'une nouvelle fichier csv  en se basant sur le nbre de fichier csv presente dans csvFles directory
    ${data}=     Query       SELECT * FROM `matiere`
    ${number_file}=   Count Files In Directory  ${pathTC1}
    Log To Console      ${number_file}
     ${listCsvFiles}=       List Files In Directory     ${pathTC1}

    Create File  ${pathTC1}test.csv${number_file}
    Log To Console   path of file is ${pathTC1}test.csv${number_file}
    FOR     ${row}      IN      @{data}
        Log To Console       ${row}
        Append To Csv File      ${pathTC1}test.csv${number_file}       ${row}
    END

create new csvfile Based on Date
    [Documentation]     chaque fois on execute le test, creation d'une nouvelle fichier csv  en se basant sur sa date de creation
    ${data}=     Query       SELECT * FROM `matiere`
    ${currentDate}=     Get Current Date        result_format=%Y-%m-%d_%H-%M-%S
    Log To Console      ${currentDate}
    Create File     ${pathTC2}test.csv${currentDate}
    Log To Console   path of file is ${pathTC2}test.csv${currentDate}
    FOR     ${row}      IN      @{data}
        Log To Console       ${row}
        Append To Csv File      ${pathTC2}test.csv${currentDate}       ${row}
    END




*** keyword ***









