*** settings ***
Library           DatabaseLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           CSVLibrary



suite setup         connection
tear down           incrementnumber


*** Variables ***
${DBHost}         localhost
${DBName}         AmazonDB4
${DBPass}
${DBPort}         3306
${DBUser}         root

${path}     C:/Users/msi/PycharmProjects/pythonProject11/automation2/CSVData2/
${number_file}=     3

*** test cases ***
import data from database
    @{data}=     Query       SELECT * FROM `users`

    FOR     ${row}      IN      @{data}
        Log To Console       ${row}
        Append To Csv File      ${path}test.csv${number_file}       ${row}
    END

*** keyword ***
connection
    ${output}=   Count Files In Directory  ${path}
    Log To Console      ${output}


    Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    Create File  ${path}test.csv${output}
    Log To Console   path of file is ${path}test.csv${output}

    ${number_file}=     Set Variable    ${output}
    Log To Console      ${number_file}




