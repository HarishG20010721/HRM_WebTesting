*** Settings ***
Documentation  Admin Page Page Object
Library  SeleniumLibrary

*** Variables ***

# Add Users Related Locators

${Add_Button_Locator} =  xpath://button[text()=' Add ']
${Add_User_Header_Locator} =  xpath://div[@class='orangehrm-card-container']/h6
${User_Role_Locator} =  xpath:(//div[@class='oxd-select-wrapper']//i)[1]
${Admin_Role_Locator} =  xpath://div/span[text()='Admin']
${ESS_Role_Locator} =  xpath://div/span[text()='ESS']
${Employee_Name_Locator} =  xpath://div[@class='oxd-autocomplete-wrapper']//input
${Select_Employee_Name_Locator} =  xpath://div[@class='oxd-autocomplete-option']/span
${Status_Locator} =  xpath:(//div[@class='oxd-select-wrapper']//i)[2]
${Enable_Status_Locator} =  xpath://div/span[text()='Enabled']
${Disable_Status_Locator} =  xpath://div/span[text()='Disabled']
${Add_User_Name_Locator} =  xpath://label[text()='Username']/parent::div/following-sibling::div/input
${Add_Password_Locator} =  xpath://label[text()='Password']/parent::div/following-sibling::div/input
${Confirm_Password_Locator} =  xpath://label[text()='Confirm Password']/parent::div/following-sibling::div/input
${Save_Button_Locator} =  xpath://button[@type='submit']
${Cancle_Button_Locator} =  xpath://button[text()=' Cancel ']
${Success_Message} =  xpath://div[@class='oxd-toast-content oxd-toast-content--success']/p[2]

# Search User Related Locators

${Number_Of_Users_Count_Locators} =  xpath://button[text()=' Add ']/parent::div/following-sibling::div/div/span
${Searched_User_Name_Locator} =  xpath://div[@class='orangehrm-container']//div[@class='oxd-table-cell oxd-padding-cell'][2]/div

# Delete User

${Select_User_CheckBox_Loactor} =  xpath://div[@class='orangehrm-container']//div[@class='oxd-table-cell oxd-padding-cell'][2]/preceding-sibling::div/div
${Delete_Button_Locator} =  xpath://i[@class='oxd-icon bi-trash']/parent::button
${Yes_Delete_Button_Locator} =  xpath://i[@class='oxd-icon bi-trash oxd-button-icon']/parent::button

*** Keywords ***

Click On Add Button
    Click Button  ${Add_Button_Locator}

Validate Add User Page
    Wait Until Page Contains Element  ${Add_User_Header_Locator}
    ${Add_User_Header} =  Get Text  ${Add_User_Header_Locator}
    [Return]  ${Add_User_Header}

Select User Role
    [Arguments]  ${user_role}
    Click Element  ${User_Role_Locator}
    Run Keyword If  '${user_role}' == 'Admin'  Click On Admin Role Selector
    Run Keyword If  '${user_role}' == 'ESS'  Click On ESS Role Selevtor

Click On Admin Role Selector
    Click Element  ${Admin_Role_Locator}

Click On ESS Role Selevtor
    Click Element  ${ESS_Role_Locator}

Enter Employee Name
    [Arguments]  ${employee_name}
    Input Text  ${Employee_Name_Locator}  ${employee_name}
    Click Element  ${Select_Employee_Name_Locator}

Select Status
    [Arguments]  ${status}
    Click Element  ${Status_Locator}
    Run Keyword If  '${status}' == 'Enable'  Click On Enable Status
    Run Keyword If  '${status}' == 'Disable'  Click On Disable Status

Click On Enable Status
    Click ELement  ${Enable_Status_Locator}

Click On Disable Status
    Click ELement  ${Disable_Status_Locator}

Enter User Name
    [Arguments]  ${user_name}
    Input Text  ${Add_User_Name_Locator}  ${user_name}

Enter Password
    [Arguments]  ${password}
    Input Text  ${Add_Password_Locator}  ${password}

Enter Confirm Password
    [Arguments]  ${confirm_password}
    Input Text  ${Confirm_Password_Locator}  ${confirm_password}

Click On Save Button
    Click Button  ${Save_Button_Locator}

Click On Cancle Button
    Click Button  ${Cancle_Button_Locator}

Validate Success Message
    ${success_message} =  Get Text  ${Success_Message}
    Log To Console  ${success_message}

Get Number Of Users
    ${Number_Of_Users} =  Get Text  ${Number_Of_Users_Count_Locators}
    Log To Console  ${Number_Of_Users}

Get User Name
    ${User_Name} =  Get Text  ${Searched_User_Name_Locator}
    Log To Console  ${User_Name}
    [Return]  ${User_Name}

Select User To Delete
    Scroll Element Into View  ${Select_User_CheckBox_Loactor}
    Wait Until Page Contains Element  ${Select_User_CheckBox_Loactor}
    wait until element is enabled  ${Select_User_CheckBox_Loactor}
    Click Element  ${Select_User_CheckBox_Loactor}

Click On Delete Icon
    Click ELement  ${Delete_Button_Locator}

Click On Yes Delete Button
    Click ELement  ${Yes_Delete_Button_Locator}