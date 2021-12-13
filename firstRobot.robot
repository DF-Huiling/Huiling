*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${appURL}    https://www.veepee.fr
${browser}    chrome


*** Test Cases ***
LoginTest With Valid Credentials
    [Tags]    Smoke
    Connect    791104 
    ${url}    Get Location
    Log To Console    ${url}    
    Should Contain    ${url}    home  
    Close Browser
 
LoginTest With InValid Credentials
    [Tags]    Regression
    Connect   ddfgf 
    ${url}    Get Location
    Log To Console    ${url}    
    Should not Contain    ${url}    home  
    ${error}  Get Text    xpath://p[@class='kawaui__sc-1ytjtdz-5 iVDrka']
    Should Contain        ${error}  email     
    Close Browser  
       
*** Keywords ***
Connect
    [Arguments]    ${password}
    Open Browser    ${appURL}    ${browser}
    Set Selenium Implicit Wait    5
    Maximize Browser Window
    Input Text    id:txtMail    clochettefeng@hotmail.com    
    Input Text    name:password    ${password} 
    Click Button    id:onetrust-accept-btn-handler   
    Click Button    id:loginBt 
    Sleep    6