*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${Employee_Name_Locator} =  xpath://label[text()='Employee Name']/parent::div/following-sibling::div//input
${Employee_Name_Search_Locator} =  xpath://div[@class='orangehrm-container']//div[@class='oxd-table-cell oxd-padding-cell'][3]/div

*** Keywords ***
Enter Employee Name
    [Arguments]  ${employee_name}
    Input Text  ${Employee_Name_Locator}  ${employee_name}

Get Employee Name
    ${employee_name} =  Get Text  ${Employee_Name_Search_Locator}
    [Return]  ${employee_name}