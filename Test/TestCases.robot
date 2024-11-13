*** Settings ***
Resource  ../Resources/MainApp.robot
Resource  ../Resources/Common.robot

Test Setup  Common.Start Web Testing
Test Teardown  Common.End Web Testing

*** Variables ***


*** Test Cases ***
Login Test Case [ Positive ]
    [Documentation]  Login Positive Scenario
    [Tags]  Login_Positive
    MainApp.Login Positive Scenario

Login test Case [ Negative ]
    [Documentation]  Login Negative Scenario
    [Tags]  Login_Negative
    MainApp.Login Negative Scenario

Add Employee Test Case
    [Documentation]
    [Tags]  Add_Employee  Functional
    MainApp.Login Positive Scenario
    MainApp.Add Employee Details

Add User Test Case
    [Documentation]  Add User
    [Tags]  Add_User  Functional
    MainApp.Login Positive Scenario
    MainApp.Add User Details

Search User Test Case
    [Documentation]  Search User
    [Tags]  Search_User
    MainApp.Login Positive Scenario
    MainApp.Search User

Create Claim Test Case
    [Documentation]  Create Claim
    [Tags]  Create_Claim  Functional
    MainApp.Login Positive Scenario
    MainApp.Create Claim

Delete User Test Case
    [Documentation]  Delete User
    [Tags]  Delete_User  Functional
    MainApp.Login Positive Scenario
    MainApp.Search User
    MainApp.Delete User

Search Employee Test Case
    [Documentation]  Search Employee
    [Tags]  Search_Employee
    MainApp.Login Positive Scenario
    MainApp.Search Employee

Delete Employee Test Case
    [Documentation]  Delete Employee
    [Tags]  Delete_Employee  Functional
    MainApp.Login Positive Scenario
    MainApp.Search Employee
    MainApp.Delete Employee


