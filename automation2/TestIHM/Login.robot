*** settings ***
Documentation
Library           OperatingSystem
Library           Selenium2Library


*** Variables ***
${homeurl}      http://automationexercise.com
${Browser}      Chrome

${name}     nesrine
${email}        nesrine4@gmail.com
${password}         111111
${incorrectemail}        yasmine@gmail.com
${incorrectpassword}         1111
${correctemail}        yasmine@gmail.com
${correctpassword}         111111
*** Test Cases ***
Register User
    Open Browser        ${homeurl}      ${Browser}
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    Page should contain     New User Signup
    Input Text      xpath://*[@id="form"]/div/div/div[3]/div/form/input[3]      ${email}
    Input Text      name=name      ${name}

    Click Button        xpath://*[@id="form"]/div/div/div[3]/div/form/button
    Page should contain     Enter Account Information



    Input Text      id=password     ${password}
    Click Element    xpath=//input[@name='title' and @value='Mrs']
    Select From List By Value    id=days    1
    Select From List By Value    id=months    1
    Select From List By Value    id=years    2000
    Select Checkbox       id=newsletter
    Input Text    id=first_name    nesrine
    Input Text    id=last_name    msaed
    Input Text    id=address1    cite ons
    Input Text    id=address2    cite ons2
    Select From List By Value    id=country    United States
    Input Text    id=state    New York
    Input Text    id=city    New York City
    Input Text    id=zipcode    10001
    Input Text    id=mobile_number    1234567890
    Click Button    xpath://*[@id="form"]/div/div/div/div[1]/form/button
    sleep       3
    Page should contain     Account Created!
    Click Link    xpath://*[@id="form"]/div/div/div/div/a
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
    sleep       3
    Page should contain     Account Deleted!


Login User with correct email and password
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    Page should contain         Login to your account
    Input Text      xpath://*[@id="form"]/div/div/div[1]/div/form/input[2]      ${correctemail}
    Input Text      xpath://*[@id="form"]/div/div/div[1]/div/form/input[3]      ${correctpassword}
    Click Button    xpath://*[@id="form"]/div/div/div[1]/div/form/button
    sleep       3
    Page Should Contain     Logged in as username
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
    sleep       3
    Page should contain     Account Deleted!


Login User with incorrect email and password
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    Page should contain         Login to your account
    Input Text      xpath://*[@id="form"]/div/div/div[1]/div/form/input[2]      ${correctemail}
    Input Text      xpath://*[@id="form"]/div/div/div[1]/div/form/input[3]      ${correctpassword}
    Click Button    xpath://*[@id="form"]/div/div/div[1]/div/form/button
    sleep       3
    Page Should Contain     Logged in as username
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
    sleep       3
*** Keywords ***
