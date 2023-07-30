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

${selectedPoduct1}       xpath:/html/body/section[2]/div/div/div[2]/div/div[2]/div[1]/div[1]
${selectedPoduct2}       xpath:/html/body/section[2]/div/div/div[2]/div/div[3]/div/div[1]/div[1]
${Selected_product_name1}       Blue Top
${Selected_product_name2}       Men Tshirt
*** Test Cases ***
Verify Test Cases Page
    Open Browser        ${homeurl}  ${Browser}
    Maximize Browser Window
    Page Should Contain Link     xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[1]/a
    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
    ${currentUrl}=      Get Location
    Log To Console      ${currentUrl}
    sleep       3
    should Contain      ${currentUrl}      test_cases

Verify All Products and product detail page
    Execute Javascript   window.open('${homeurl}');
    Switch Window    NEW    # Switch to the newly opened window

    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
    ${currentUrl}=      Get Location
    Log To Console      ${currentUrl}
    should Contain      ${currentUrl}      /products
    sleep       3
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
    Execute Javascript   window.open('${homeurl}');
    Switch Window    NEW    # Switch to the newly opened window

    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
    sleep   3
    Page should contain     All Products
    Input Text      id=search_product      ${searchedProduct}
    Click Button        id=submit_search
    Page Should Contain     Searched Products


Verify Subscription in home page
    Execute Javascript   window.open('${homeurl}');
    Switch Window    NEW    # Switch to the newly opened window

    Scroll Element Into View        id=footer
    Page Should Contain     Subscription
    Input Text      id=susbscribe_email     ${susbscribe_email}
    Page Should Contain     You have been successfully subscribed!

Add Products in Cart
    Execute Javascript   window.open('${homeurl}');
    Switch Window    NEW    # Switch to the newly opened window


   Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
   Mouse Over      ${selectedPoduct1}
   Click Link      xpath:/html/body/section[2]/div/div/div[2]/div/div[2]/div[1]/div[1]/div[2]/div/a
   Wait Until Element Is Visible       xpath://*[@id="cartModal"]/div/div/div[2]/p[2]/a
   Click Link      xpath://*[@id="cartModal"]/div/div/div[2]/p[2]/a

    # Check if the selected product exists in the cart
    Product Should Be In Cart        ${Selected_product_name1}

Verify Product quantity in Cart
    Execute Javascript   window.open('${homeurl}');
    Switch Window    NEW    # Switch to the newly opened window

    Click Link      xpath:/html/body/section[2]/div/div/div[2]/div[1]/div[5]/div/div[2]/ul/li/a
    sleep       3
    ${currentUrl}=      Get Location
    Log To Console      ${currentUrl}
    sleep       3
    should Contain      ${currentUrl}      product_details

    Increase Quantity    3
    Click button        xpath:/html/body/section/div/div/div[2]/div[2]/div[2]/div/span/button
    sleep       3
    click link      xpath://*[@id="cartModal"]/div/div/div[2]/p[2]/a





Remove Products From Cart
    Execute Javascript   window.open('${homeurl}');
    Switch Window    NEW    # Switch to the newly opened window

    Click Link      xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a
    sleep       3
    Page should contain     Shopping Cart
    Click Link      xpath://*[@id="product-1"]/td[6]/a
    sleep       5
    Page should not contain     ${Selected_product_name1}





*** Keywords ***
Product Should Be In Cart
    [Arguments]    ${Selected_product_name1}
    ${cart_items}    Get WebElements    xpath://*[@class="cart-item"]
    FOR    ${item}    IN    @{cart_items}
        ${item_text}    Get Text    ${item}
        Run Keyword If    '${Selected_product_name1}' in '${item_text}'   Log    Product exists in the cart: ${item_text}    console=TRUE
    END

Increase Quantity
    [Arguments]    ${amount_to_increase}
    ${initial_quantity}    Get Value        id=quantity
    Log To Console       ${initial_quantity}
    ${initial_quantity}    Evaluate    ${initial_quantity} + ${amount_to_increase}
    Log To Console       ${initial_quantity}
    Clear Element Text      id=quantity
    Input Text      id=quantity     ${initial_quantity}
