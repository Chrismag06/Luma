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
${SELSPEED}  0.0s

*** Test Cases ***
robotframework-testing_selenium
    [Setup]  Run Keywords  Open Browser  https://magento.softwaretestingboard.com/customer/account/login/referer/aHR0cHM6Ly9tYWdlbnRvLnNvZnR3YXJldGVzdGluZ2JvYXJkLmNvbS8%2C/  ${BROWSER}
    ...              AND   Set Selenium Speed  ${SELSPEED}
    # open    https://magento.softwaretestingboard.com/customer/account/login/referer/aHR0cHM6Ly9tYWdlbnRvLnNvZnR3YXJldGVzdGluZ2JvYXJkLmNvbS8%2C/
    click    xpath=//div[2]/div/input
    type     xpath=//div[2]/div/input    userone@gmail44.com
    click    id=pass
    type     id=pass    wB24NxC!y.Ers@y
    click    id=send2
    open     https://magento.softwaretestingboard.com/
    open     https://magento.softwaretestingboard.com/women/tops-women/jackets-women.html
    open     https://magento.softwaretestingboard.com/olivia-1-4-zip-light-jacket.html
    Sleep    5s
    click    id=option-label-color-93-item-49
    Sleep    5s
    click    id=option-label-size-143-item-169
    click    xpath=//button[@id='product-addtocart-button']/span
    Assert Cart 
    Sleep    5s
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='My Cart'])[1]/following::span[1]
    Sleep    5s
    click    xpath=//div[@id='minicart-content-wrapper']/div[2]/div[5]/div/a/span
    #click    link=Remove
    #click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Cancel'])[1]/following::button[1]
    #[Teardown]  Close Browser

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

Assert Cart
    ${cart_items} =    Get WebElements    xpath=//header/div[2]/div[1]/a[1]/span[2]/span[1]
    ${item_count} =    Get Length    ${cart_items}
    Should Be Equal As Numbers    ${item_count}    1    Le nombre d'éléments dans le panier n'est pas égal à 1
