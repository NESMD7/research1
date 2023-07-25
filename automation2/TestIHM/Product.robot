*** settings ***
Documentation
Library           OperatingSystem
Library           Selenium2Library


*** Variables ***
${homeurl}      http://automationexercise.com
${Browser}      Chrome

${productname}      Blue Top
${category}     Women > Tops

${price}        Rs. 500
${availability}     In Stock
${condition}        New
${brand}        Polo
*** Test Cases ***
Verify Test Cases Page
    Open Browser        ${homeurl}  ${Browser}
    Maximize Browser Window
    Page Should Contain Link     xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[1]/a
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
    ${currentUrl}=      Get Location
    Log To Console      ${currentUrl}
    should Contain      ${currentUrl}      test_cases

Verify All Products and product detail page
    Go Back   ${homeurl}
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
    ${currentUrl}=      Get Location
    Log To Console      ${currentUrl}
    should Contain      ${currentUrl}      /products
    Page should contain     "ALL PRODUCTS"
    Click Link      xpath:/html/body/section[2]/div[1]/div/div[2]/div/div[2]/div[1]/div[2]/ul/li/a
    ${currentUrl}=      Get Location
    Log To Console      ${currentUrl}
    should Contain      ${currentUrl}      /product_details/1
    Page should contain     ${productname}, ${category}, ${price}, ${availability}, ${condition}, ${brand}

Search Product
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a

*** Keywords ***
