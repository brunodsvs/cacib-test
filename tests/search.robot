*** Settings ***
Resource    keywords.robot
Test Setup    Open Browser and Navigate to Page
Test Teardown    Close Browser

*** Test Cases ***
Shop Test
    Navigate to Products Page
    
    #Verify if the search bar is visible
    Verify Search Bar Visibility

    #Search for 'men tshirt' and verify its visibility
    Search for Product    ${FIRSTITEM}
    Verify Product Visibility    ${FIRSTITEM}
    Add Product to Cart    ${FIRSTITEM}
    Search for Product    ${SECONDITEM}
    Verify Product Visibility    ${SECONDITEM}
    Add Product to Cart    ${SECONDITEM}

    #Go to the cart
    Click Cart Button

    #Verify products in cart
    Verify Product in Cart    ${FIRSTITEM}
    Verify Product in Cart    ${SECONDITEM}
