*** Settings ***
Documentation  Login Page Page Object
Library  SeleniumLibrary
Resource  ../../TestData/Data.robot
Resource  DashboardPage.robot

*** Variables ***

${UserName_Locator} =  name:username
${Password_Locator} =  name:password
${Login_Button} =  xpath://button[@type='submit']
${Error_Locatior} =  xpath://div[@class='oxd-alert-content oxd-alert-content--error']//p

*** Keywords ***

Enter User Name
    [Arguments]  ${username}
    Input Text  ${UserName_Locator}  ${username}

Enter Password
    [Arguments]  ${password}
    Input Text  ${Password_Locator}  ${password}

Click On Login Button
    Click Button  ${Login_Button}


Read Error Value
    ${error} =  Get Text  ${Error_Locatior}
    [Return]  ${error}

