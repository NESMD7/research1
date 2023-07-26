*** settings ***
Documentation
Library           OperatingSystem
Library           SeleniumLibrary


*** Variables ***
${homeurl}      http://automationexercise.com
${Browser}      Chrome

${productname}      Blue Top
${category}     Category: Women > Tops

${price}        Rs. 500
${availability}     In Stock
${condition}        New
${brand}        Polo


${searchedProduct}      Stylish Dress
${susbscribe_email}     nesrinemsaed1@gmail.com

${selectedPoduct}       xpath:/html/body/section[2]/div/div/div[2]/div/div[2]/div[1]/div[1]
${selectedPoduct}       xpath:/html/body/section[2]/div/div/div[2]/div/div[3]/div/div[1]/div[1]

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
    Open Browser        ${homeurl}  ${Browser}
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
    ${currentUrl}=      Get Location
    Log To Console      ${currentUrl}
    should Contain      ${currentUrl}      /products
    Page should contain     All Products
    Click Link      xpath:/html/body/section[2]/div[1]/div/div[2]/div/div[2]/div[1]/div[2]/ul/li/a
    ${currentUrl}=      Get Location
    Log To Console      ${currentUrl}
    should Contain      ${currentUrl}      /product_details/1
    Page should contain     ${productname}
    Page should contain        ${category}
    Page should contain     ${price}
    Page should contain     ${availability}
    Page should contain     ${condition}
    Page should contain     ${brand}


Search Product
    Open Browser        ${homeurl}  ${Browser}
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
    Page should contain     All Products
    Input Text      id=search_product      ${searchedProduct}
    Click Button        id=submit_search
    Page Should Contain     Searched Products


Verify Subscription in home page
    Open Browser        ${homeurl}  ${Browser}
    Scroll Element Into View        id=footer
    Page Should Contain     Subscription
    Input Text      id=susbscribe_email     ${susbscribe_email}
    Page Should Contain     You have been successfully subscribed!

Add Products in Cart
    Open Browser        ${homeurl}  ${Browser}
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a


    Mouse Over      ${selectedProduct1}
    Click Link      xpath:/html/body/section[2]/div/div/div[2]/div/div[2]/div[1]/div[1]/div[2]/div/a
    Wait Until Element Is Visible    class:btn.btn-success.close-modal.btn-block
    Click Button    class:btn.btn-success.close-modal.btn-block


    Mouse Over      ${selectedProduct2}
    Click Link      xpath:/html/body/section[2]/div/div/div[2]/div/div[2]/div[1]/div[1]/div[2]/div/a
    Wait Until Element Is Visible    class:btn.btn-success.close-modal.btn-block
    Click Button    class:btn.btn-success.close-modal.btn-block

    Click Link      xpath://*[@id="cartModal"]/div/div/div[2]/p[2]/a


*** Keywords ***
