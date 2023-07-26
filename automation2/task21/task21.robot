*** settings ***
Library           DatabaseLibrary
Library           OperatingSystem
Library           Selenium2Library
Library           CSVLibrary
Library           Collections
Library    String



suite setup    connexion
Suite Teardown     Disconnect From Database

*** Variables ***
${DBHost}         localhost
${DBName}         task21db
${DBPass}
${DBPort}         3306
${DBUser}         root

${csvdata}      C:/Users/n.msaed/PycharmProjects/pythonProject/automation2/task21/data21.csv
${newrow}       ""
*** Test Cases ***
create table
    ${output} =     Execute SQL String    CREATE TABLE `users`(`id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `email` varchar(255) NOT NULL, PRIMARY KEY (`id`))


insert data from csv to DB
     @{list0}=  read csv file to list  ${csvdata}
      FOR    ${row}    IN    @{list0}
        Log To Console     ${row}
        LOG TO CONSOLE  **********************************
        ${lenrow}=     Get Length       ${row}
        LOG TO CONSOLE      ${lenrow}
        ${list1} =	Create List

        FOR    ${i}    IN RANGE    ${lenrow}
            Log To Console      ${row[${i}]}
            ${lenitem}=     Get Length       ${row[${i}]}


            ${s1}=    Get Substring	    ${row[${i}]}		0   4
            ${s2}=    Get Substring 	${row[${i}]}		4
            ${s3}=    Catenate      ${s1}A${s2}A
            Log To Console       ${s3}
            Append To List     ${list1}      ${s3}

        END
        Log To Console      newlist: ${list1}
        Execute SQL String    INSERT INTO `users` (email, name) VALUES ('${list1[0]}', '${list1[1]}');

      END
*** Keywords ***
connexion
     Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
     Execute SQL String      Drop Table users
