*** Settings ***
Resource    ../taskresource.resource
Test Setup    Open AiSingapore
Test Teardown    Close Browser

*** Tasks ***
Login To Task Page
    Login    ${USERNAME}    ${PASSWORD}

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

Add A Job
    [Arguments]    ${jobTitle}    ${jobDescription}    ${hiringDepartment}    
    ...    ${educationLevel}    ${postingStartDate}    ${postingEndDate}    ${remote}    ${jobType}
    Click    //span[normalize-space()='New Job Posting']
    Type Text    //input[@id='jobTitle']        ${jobTitle}


