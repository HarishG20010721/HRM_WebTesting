*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${Assign_Claim_Locator} =  xpath://div[@class='orangehrm-header-container']/button
${Event_Drop_Down_Locator} =  xpath:(//div[@class='oxd-select-text--after'])[1]
${Event_Accommodation_Locator} =  xpath://span[text()='Accommodation']
${Currency_Drop_Down_Locator} =  xpath:(//div[@class='oxd-select-text--after'])[2]
${Indian_Currency_Locator} =  xpath://span[text()='Indian Rupee']
${Create_Button_Locator} =  xpath://button[@type='submit']
${Add_Expense_Button} =  xpath:(//div[@class='orangehrm-action-header'])[1]//button
${Calander_Input_Box_Locator} =  xpath://div[@class='oxd-date-input']/input
${Calander_Year_Drop_Down} =  xpath:(//i[@class='oxd-icon bi-caret-down-fill oxd-icon-button__icon'])[2]
${Calander_Month_Drop_Down} =  xpath:(//i[@class='oxd-icon bi-caret-down-fill oxd-icon-button__icon'])[1]
${Calander_Year_Value_Locator} =  xpath://li[text()='2020']
${Calander_Month_Value_Locator} =  xpath://li[text()='July']
${Calender_Date_Locators} =  xpath://div[@class='oxd-calendar-dates-grid']//div//div
${Amount_Input_Box_Locator} =  xpath://label[text()='Amount']/parent::div/following-sibling::div/input
${Add_Attachment_Button_Locator} =  xpath:(//div[@class='orangehrm-action-header'])[2]//button
${Browse_Button_Locator} =  xpath://input[@type='file']



*** Keywords ***
Click On Assign Claim
    Click Button  ${Assign_Claim_Locator}

Select Event Type
    Click Element  ${Event_Drop_Down_Locator}
    Click Element  ${Event_Accommodation_Locator}

Select Currency Type
    Click Element  ${Currency_Drop_Down_Locator}
    Scroll Element Into View  ${Indian_Currency_Locator}
    Click Element  ${Indian_Currency_Locator}

Click On Create Button
    Click Button  ${Create_Button_Locator}

Click On Add Expense Button
    Click Button  ${Add_Expense_Button}

Select Expense Data
    Click Element  ${Calander_Input_Box_Locator}
    Click Element  ${Calander_Year_Drop_Down}
    Scroll Element Into View  ${Calander_Year_Value_Locator}
    Click Element  ${Calander_Year_Value_Locator}
    Click Element  ${Calander_Month_Drop_Down}
    Scroll Element Into View  ${Calander_Month_Value_Locator}
    Click Element  ${Calander_Month_Value_Locator}
    ${DATE_LOCATORS_LIST} =  Get WebElements  ${Calender_Date_Locators}
    ${date_elements_count} =  Get Length  ${DATE_LOCATORS_LIST}
    FOR  ${i}  IN RANGE  1  ${date_elements_count}
        ${date_value} =  Get Text  xpath:(//div[@class='oxd-calendar-dates-grid']//div//div)[${i}]
        Run Keyword If  '${date_value}' == '11'  Click Element  xpath:(//div[@class='oxd-calendar-dates-grid']//div//div)[${i}]
        exit for loop if  '${date_value}' == '11'
    END

Enter Amount
    [Arguments]  ${amount}
    Input Text  ${Amount_Input_Box_Locator}  ${amount}

Click On Add Attachment Button
    Sleep  10s
    Scroll Element Into View  ${Add_Attachment_Button_Locator}
    Click Button  ${Add_Attachment_Button_Locator}

Upload File
    [Arguments]  ${file_path}
    Choose File  ${Browse_Button_Locator}  ${file_path}