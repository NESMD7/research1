*** settings ***
Library           DatabaseLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           CSVLibrary


suite setup    connexion
Suite Teardown     Disconnect From Database

*** Variables ***
${DBHost}         localhost
${DBName}         AmazonDB4
${DBPass}
${DBPort}         3306
${DBUser}         root

*** Test Cases ***
Create user table
    ${output} =     Execute SQL String    CREATE TABLE `users`(`id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `email` varchar(255) NOT NULL, PRIMARY KEY (`id`))


insert data from csv to DB
     @{list}=  read csv file to list  C:/Users/msi/PycharmProjects/pythonProject11/automation/RobotFiles/CSVData/data1.csv
      FOR    ${row}    IN    @{list}
        Log To Console     ${row}
        LOG TO CONSOLE  **********************************
        Execute SQL String    INSERT INTO `users` (email, name) VALUES ('${row[0]}', '${row[1]}' );
      END

check if user exist
    ${output}=   Check If Exists In Database    SELECT id FROM users WHERE name = 'yassine';
    Log To Console      ${output}



*** Keywords ***
connexion
     Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
     Execute SQL String    DROP TABLE users

