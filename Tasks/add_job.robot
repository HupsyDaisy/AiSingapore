*** Settings ***
Library    String    
Library           Collections
Resource    ../taskresource.resource
Test Setup    Test Setup
Test Teardown    Close Browser

*** Variables ***
${CSV_PATH}       ${CURDIR}/../Libs/datatable.csv

*** Test Cases ***

Upload All Jobs From CSV
    ${jobs}=    Read Jobs CSV    ${CSV_PATH}
    FOR    ${row}    IN    @{jobs}
        Add A Job From Row    ${row}
    END

*** Keywords ***

Add A Job From Row
    [Arguments]    ${row}
    ${jobTitle}=            Get From Dictionary    ${row}    jobTitle
    ${jobDescription}=      Get From Dictionary    ${row}    jobDescription
    ${hiringDepartment}=    Get From Dictionary    ${row}    hiringDepartment
    ${educationLevel}=      Get From Dictionary    ${row}    educationLevel
    ${postingStartDate}=    Get From Dictionary    ${row}    postingStartDate
    ${postingEndDate}=      Get From Dictionary    ${row}    postingEndDate
    ${remote}=              Get From Dictionary    ${row}    remote
    ${jobType}=             Get From Dictionary    ${row}    jobType
    ${remote}=    Strip String    ${remote}
    ${jobType}=   Strip String    ${jobType}

    Add A Job   ${jobTitle}    ${jobDescription}    ${hiringDepartment}    
    ...    ${educationLevel}    ${postingStartDate}    ${postingEndDate}    ${remote}    ${jobType}

Add A Job
    [Arguments]    ${jobTitle}    ${jobDescription}    ${hiringDepartment}    
    ...    ${educationLevel}    ${postingStartDate}    ${postingEndDate}    ${remote}    ${jobType}
    Click    //span[normalize-space()='New Job Posting']
    Type Text    //input[@id='jobTitle']        ${jobTitle}
    Type Text    //textarea[@id='jobDescription']       ${jobDescription}
    Select Options By    //select[@id='hiringDepartment']    value    ${hiringDepartment}
    Select Options By    //select[@id='educationLevel']    value    ${educationLevel}
    Type Text    //input[@id='postingStartDate']    ${postingStartDate}
    Type Text    //input[@id='postingEndDate']    ${postingEndDate}
    IF    "Yes" in "${remote}"           Click    //input[@value='Yes']
    IF    "No" in "${remote}"            Click    //input[@value='No']
    IF    "Full-time" in "${jobType}"    Click    //input[@id='jobTypeFullTime']
    IF    "Part-time" in "${jobType}"    Click    //input[@id='jobTypePartTime']
    IF    "Temp" in "${jobType}"         Click    //input[@id='jobTypeTemp']
    IF    "Permanent" in "${jobType}"    Click    //input[@id='jobTypePermanent']
    Click    //span[normalize-space()='Submit']
    Wait For Elements State    (//a[normalize-space()='Logout'])[1]    visible    timeout=10s
    
    

    



