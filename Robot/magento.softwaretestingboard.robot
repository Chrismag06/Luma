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
Test Teardown    Close Browser

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
    type    xpath=//div[2]/div/input    userone@gmail44.com
    click    id=pass
    type    id=pass    wB24NxC!y.Ers@y
    click    id=send2
    open    https://magento.softwaretestingboard.com/
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