*** settings ***
Library           DatabaseLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           CSVLibrary



suite setup         connection


*** Variables ***
${DBHost}         localhost
${DBName}         AmazonDB4
${DBPass}
${DBPort}         3306
${DBUser}         root

*** test cases ***
import data from database
    @{queryResults}=     Query       SELECT * FROM `users`
    FOR     ${row}      IN      @{queryResults}
        Log To Console       ${row}
        Append To Csv File      C:/Users/msi/PycharmProjects/pythonProject11/automation/RobotFiles/CSVData/data.csv       ${row}
    END
*** keyword ***
connection
    Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    Empty Csv File       C:/Users/msi/PycharmProjects/pythonProject11/automation/RobotFiles/CSVData/data.csv