*** Settings ***
Library  ../Calculatrice.py

*** Test Cases ***
Addition Test
    [Documentation]  test d'addition
    ${result}  addition  5  3
    Should Be Equal As Numbers    ${result}    8

Soustraction Test
    [Documentation]  test de soustraction
    ${result}    Soustraction  5  3
    Should Be Equal As Numbers    ${result}    2

Multiplication Test
    [Documentation]  test de multiplication
    ${result}    Multiplication  2  5
    Should Be Equal As Numbers  ${result}    10

Division Test
    [Documentation]  test de division
    ${result}    Division  10  2
    Should Be Equal As Numbers  ${result}    5

Division par zero test
    [Documentation]  test de division par zero
    ${result}  Division  10  0
    Should Be Equal As Strings  ${result}  Division par 0 impossible  
    
