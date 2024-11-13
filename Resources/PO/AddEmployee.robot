*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${Add_Employee_Header} =  xpath://div[@class='orangehrm-card-container']/h6
${Frist_Name_Locator} =  name:firstName
${Middle_Name_Locator} =  name:middleName
${Last_Name_Locator} =  name:lastName
${Employee_Id_Locator} =  xpath://label[text()='Employee Id']/parent::div/following-sibling::div/input

*** Keywords ***

Validate Add Employee Header
    Wait Until Page Contains Element  ${Add_Employee_Header}
    ${add_employee_header} =  Get Text  ${Add_Employee_Header}
    Log To Console  ${add_employee_header}

Enter First Name
    [Arguments]  ${first_name}
    Input Text  ${Frist_Name_Locator}  ${first_name}

Enter Middle Name
    [Arguments]  ${middle_name}
    Input Text  ${Middle_Name_Locator}  ${middle_name}

Enter Last Name
    [Arguments]  ${last_name}
    Input Text  ${Last_Name_Locator}  ${last_name}

Enter Employee Id
    [Arguments]  ${employee_id}
#    Clear Element Text  ${Employee_Id_Locator}
    Press Keys  ${Employee_Id_Locator}  CTRL+a+BACKSPACE
    Input Text  ${Employee_Id_Locator}  ${employee_id}

