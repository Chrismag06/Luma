Creer un compte
Login
Ajout des articles au panier
Assert
Modification du panier (edit/suppression)
Assert
Logout


*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    https://www.google.com/    chrome
# Test Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${BASE_URL}    https://www.google.com/
${LOGIN_URL}    https://magento.softwaretestingboard.com/
${SELSPEED}  0.5s
${EMAIL}    userone@gmail44.com
${PASSWORD}    wB24NxC!y.Ers@y

*** Test Cases ***
robotframework-testing_selenium
    [Setup]  Run Keywords  Open Browser  https://magento.softwaretestingboard.com/customer/account/login/referer/aHR0cHM6Ly9tYWdlbnRvLnNvZnR3YXJldGVzdGluZ2JvYXJkLmNvbS8%2C/  ${BROWSER}
    ...              AND   Set Selenium Speed  ${SELSPEED}
    Login    ${EMAIL}    ${PASSWORD}
    Select Article
    Assert Cart 
    Sleep  5s
    Open Basket Page
    Sleep  5s
    Update Quantity
    Sleep  5s
    Assert Cart After Update Quantity
    Remove Article
    Sleep  5s
    [Teardown]  Close Browser

*** Keywords ***
open
    [Arguments]    ${element}
    Go To          ${element}
click
    [Arguments]    ${element}
    Click Element  ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

Login 
    [Documentation]  login 
    [Arguments]  ${EMAIL}    ${PASSWORD}
    click    xpath=//div[2]/div/input
    type     xpath=//div[2]/div/input    ${EMAIL} 
    click    id=pass
    type     id=pass    ${PASSWORD}
    click    id=send2
    open     https://magento.softwaretestingboard.com/

Assert Cart
    ${cart_items} =    Get WebElements    xpath=//header/div[2]/div[1]/a[1]/span[2]/span[1]
    ${item_count} =    Get Length    ${cart_items}
    Should Be Equal As Numbers    ${item_count}    1    Le nombre d'éléments dans le panier n'est pas égal à 1

Assert Cart After Update Quantity
    ${cart_items} =    Get WebElements    xpath=//html[1]/body[1]/div[2]/main[1]/div[3]/div[1]/div[3]/form[1]/div[1]/table[1]/tbody[1]/tr[1]/td[3]/div[1]/div[1]/label[1]/input[1]
    ${item_count} =    Get Length    ${cart_items}
    Should Be Equal As Numbers    ${item_count}    6    Le nombre d'éléments dans le panier n'est pas égal à 6

Update Quantity
    Log To Console  Update quantity
    click    xpath=//html[1]/body[1]/div[2]/main[1]/div[3]/div[1]/div[3]/form[1]/div[1]/table[1]/tbody[1]/tr[1]/td[3]/div[1]/div[1]/label[1]/input[1]
    type    xpath=//html[1]/body[1]/div[2]/main[1]/div[3]/div[1]/div[3]/form[1]/div[1]/table[1]/tbody[1]/tr[1]/td[3]/div[1]/div[1]/label[1]/input[1]  5
    click    xpath=//table[@id='shopping-cart-table']/tbody/tr/td[3]
    click    xpath=//form[@id='form-validate']/div[2]/button[2]/span

Open Basket Page
    Log To Console  Open Basket Page
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Cart'])[1]/following::span[1]
    click    xpath=//div[@id='minicart-content-wrapper']/div[2]/div[5]/div/a/span

Select Article
    open     https://magento.softwaretestingboard.com/women/tops-women/jackets-women.html
    open     https://magento.softwaretestingboard.com/olivia-1-4-zip-light-jacket.html
    Sleep    5s
    click    id=option-label-color-93-item-49
    Sleep    5s
    click    id=option-label-size-143-item-169
    click    xpath=//button[@id='product-addtocart-button']/span

Remove Article
    click    link=Remove item
 
