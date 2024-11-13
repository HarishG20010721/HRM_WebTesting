*** Settings ***



*** Variables ***

${Dashboard_Header_Locator} =  xpath://span[@class='oxd-topbar-header-breadcrumb']/h6


*** Keywords ***
Validate Login Success
    ${validate_message} =  Get Text  ${Dashboard_Header_Locator}
    [Return]  ${validate_message}