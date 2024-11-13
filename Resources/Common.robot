*** Settings ***
Library  SeleniumLibrary
Resource  ../TestData/Data.robot

*** Variables ***


*** Keywords ***

Start Web Testing
    Open Browser  ${URL}  ${BROWSER}
    maximize browser window
    Set Selenium Implicit Wait  15s

End Web Testing
    Close All Browsers
