*** Settings ***
Library  SeleniumLibrary


*** Variables ***

${Admin_Link_Locator} =  xpath://span[text()='Admin']/parent::a
${PIM_Link_Locator} =  xpath://span[text()='PIM']/parent::a
${Claim_Link_Locator} =  xpath://span[text()='Claim']/parent::a

*** Keywords ***

Click On Admin Link
    Wait Until Page Contains Element  ${Admin_Link_Locator}
    Click Link  ${Admin_Link_Locator}

Click On PIM Link
    Click Link  ${PIM_Link_Locator}

Click On Claim Link
    Click Link  ${Claim_Link_Locator}


