*** settings ***
Documentation
Library           RequestsLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           CSVLibrary
Library           DatabaseLibrary

suite setup     connexion
Suite Teardown     Disconnect From Database

*** Variables ***
${DBHost}         localhost
${DBName}         task31
${DBPass}
${DBPort}         3306
${DBUser}         root


${csvfile}       C:/Users/msi/PycharmProjects/pythonProject11/automation2/TestApi/CsvData/ValidDataUse.csv
${url}      http://localhost:8888
*** Test Cases ***


Successfull signUp
    [Documentation]     faire entrer des données valides pour faire le signup, et stocker le user Dans BD

    # create the 'users' table
    ${output}=    Execute SQL String    CREATE TABLE `users`(`id` INT AUTO_INCREMENT PRIMARY KEY,`userName` VARCHAR(255) NOT NULL,`userFirstName` VARCHAR(255) NOT NULL,`userLastName` VARCHAR(255) NOT NULL,`userPassword` VARCHAR(255) NOT NULL,`phone` INT(20),`sectionName` VARCHAR(255) NOT NULL)

    # read data from CSV and insert into the table
    @{userData}=    Read CSV File To List    ${csvfile}

        ${userName}         Set Variable    ${userData[0][0]}
        ${userFirstName}    Set Variable    ${userData[0][1]}
        ${userLastName}     Set Variable    ${userData[0][2]}
        ${userPassword}     Set Variable    ${userData[0][3]}
        ${phone}            Set Variable    ${userData[0][4]}
        ${sectionName}      Set Variable    ${userData[0][5]}


        ${body}=            Create Dictionary  userName=${userName}  userFirstName=${userFirstName}  userLastName=${userLastName}  userPassword=${userPassword}  phone=${phone}  sectionName=${sectionName}
        Log To Console      ${body}
        ${resp}=            POST  ${url}/registerNewUser  json=${body}
        Status Should Be    200                   ${resp}
        Log To Console      ${resp}

    Execute SQL String    INSERT INTO `users` (userName, userFirstName, userLastName, userPassword, phone, sectionName) VALUES ('${userName}', '${userFirstName}', '${userLastName}', '${userPassword}', ${phone}, '${sectionName}')



*** Keywords ***
connexion
     Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
     Execute SQL String    DROP TABLE users


