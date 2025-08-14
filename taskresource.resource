*** Settings ***
Library    Browser
Variables    ../locators.py
Library    Libs/CustomLibrary.py

*** Variables ***
${URL}    https://rpaexercise.aisingapore.org/login
${USERNAME}    jane007
${PASSWORD}    TheBestHR123

*** Keywords ***
Open AiSingapore
    [Arguments]      ${headless}=${false}     
    New Browser    chromium     headless=${Headless}
    New Page    ${URL}    

Login
    [Arguments]      ${username}     ${password}
    New Page    ${URL} 
    Type Text    //input[@id='outlined-search']    ${username}
    Type Text    ${ADD_PASWORD}          ${password}
    Click        ${LOGIN_BUTTON}
    Wait For Elements State    ${LOG_OUT_VISIBLE}    visible    timeout=10s

Test Setup
    Open AiSingapore
    Login    ${username}     ${password}