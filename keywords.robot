*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${BROWSER}    firefox
${BASEURL}   http://automationexercise.com/
${FIRSTITEM}    Men Tshirt
${SECONDITEM}    Premium Polo T-Shirts 

*** Keywords ***
Open Browser and Navigate to Page
    Open Browser    ${BASEURL}    ${BROWSER}
    Maximize Browser Window

Navigate to Products Page

    Click Element    //img[@src="/static/images/home/logo.png"]
    Assign Id To Element  //a[text()=' Products']  produts
    Wait Until Element Is Enabled    produts
    Click Element  produts
    Unselect Frame
        
Verify Search Bar Visibility
    Wait Until Element Is Visible    xpath://*[@id="search_product"]
    Page Should Contain Element    xpath://*[@id="search_product"]

Search for Product
    [Arguments]    ${item}
    Input Text    xpath://*[@id="search_product"]    ${item}
    Click Button    xpath://*[@id="submit_search"]

Verify Product Visibility
    [Arguments]    ${item}
    Page Should Contain    ${item}

Add Product to Cart
    [Arguments]    ${item}
    Mouse Over    //img[@src="/get_product_picture/2"]
    Page Should Contain    ${item}
    Click Element    //a[text()='Add to cart']
    Page Should Contain    xpath://*[@id="cartModal"]    Your product has been added to cart.
    Handle Alert    DISMISS

Click Cart Button
    Click Link    xpath=//a[@href="/view_cart"]

Verify Product in Cart
    [Arguments]    ${item}
    Page Should Contain    ${item}




    