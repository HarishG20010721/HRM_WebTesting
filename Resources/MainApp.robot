*** Settings ***
Library  String
Resource  PO/LoginPage.robot
Resource  PO/DashboardPage.robot
Resource  PO/SideBar.robot
Resource  PO/AdminPage.robot
Resource  PO/AddEmployee.robot
Resource  PO/PIMPage.robot
Resource  PO/ClaimPage.robot
Resource  ../TestData/Data.robot

*** Variables ***



*** Keywords ***

Login Positive Scenario
    LoginPage.Enter User Name  ${Login_Credentials_Positive.UserName}
    LoginPage.Enter Password  ${Login_Credentials_Positive.Password}
    LoginPage.Click On Login Button
    ${result} =  DashboardPage.Validate Login Success
    Log To Console  ${result}

Login Negative Scenario
    LoginPage.Enter User Name  ${Login_Credentials_Negative.UserName}
    LoginPage.Enter Password  ${Login_Credentials_Negative.Password}
    LoginPage.Click On Login Button
    ${error} =  LoginPage.Read Error Value
    Log To Console  ${error}

Add Employee Details
    SideBar.Click On PIM Link
    AdminPage.Click On Add Button
    AddEmployee.Validate Add Employee Header
    AddEmployee.Enter First Name  ${Employee_Details.First_Name}
    AddEmployee.Enter Middle Name  ${Employee_Details.Middle_Name}
    AddEmployee.Enter Last Name  ${Employee_Details.Last_Name}
    AddEmployee.Enter Employee Id  ${Employee_Details.Employee_Id}
    AdminPage.Click On Save Button
    AdminPage.Validate Success Message

Add User Details
    SideBar.Click On Admin Link
    AdminPage.Click On Add Button
    AdminPage.Validate Add User Page
    AdminPage.Select User Role  ${User_Details.Role}
    AdminPage.Enter Employee Name  ${User_Details.Employee_Name}
    AdminPage.Select Status  ${User_Details.Status}
    AdminPage.Enter User Name  ${User_Details.User_Name}
    AdminPage.Enter Password  ${User_Details.Password}
    AdminPage.Enter Confirm Password  ${User_Details.Confirm_Password}
    AdminPage.Click On Save Button
    AdminPage.Validate Success Message

Search User
    SideBar.Click On Admin Link
    AdminPage.Enter User Name  ${User_Details.User_Name}
    AdminPage.Select User Role  ${User_Details.Role}
    AdminPage.Enter Employee Name  ${User_Details.Employee_Name}
    AdminPage.Select Status  ${User_Details.Status}
    AdminPage.Click On Save Button
    AdminPage.Get Number Of Users
    ${expected_value} =  AdminPage.Get User Name
    Should Be Equal AS Strings  ${expected_value}  ${User_Details.User_Name}

Delete User
    AdminPage.Select User To Delete
    AdminPage.Click On Delete Icon
    AdminPage.Click On Yes Delete Button
    AdminPage.Validate Success Message

Search Employee
    SideBar.Click On PIM Link
    PIMPage.Enter Employee Name  ${Employee_Details.First_Name}
    AddEmployee.Enter Employee Id  ${Employee_Details.Employee_Id}
    AdminPage.Click On Save Button
    ${expected_value_employee} =  PIMPage.Get Employee Name
    ${substring} =  Get Sub String  ${expected_value_employee}  0  -2
    Log To Console  ${substring}
    Should Be Equal AS Strings  ${substring}  ${Employee_Details.First_Name}

Delete Employee
    SideBar.Click On PIM Link
    PIMPage.Enter Employee Name  ${Employee_Details.First_Name}
    AddEmployee.Enter Employee Id  ${Employee_Details.Employee_Id}
    AdminPage.Click On Save Button
    AdminPage.Select User To Delete
    AdminPage.Click On Delete Icon
    AdminPage.Click On Yes Delete Button
    AdminPage.Validate Success Message

Create Claim
    SideBar.Click On Claim Link
    ClaimPage.Click On Assign Claim
    AdminPage.Enter Employee Name  ${User_Details.Employee_Name}
    ClaimPage.Select Event Type
    ClaimPage.Select Currency Type
    ClaimPage.Click On Create Button
    AdminPage.Validate Success Message
    ClaimPage.Click On Add Expense Button
    ClaimPage.Select Event Type
    ClaimPage.Select Expense Data
    ClaimPage.Enter Amount  ${Claim_Details.Amount}
    AdminPage.Click On Save Button
    ClaimPage.Click On Add Attachment Button
    ClaimPage.Upload File  ${File_Tobe_Upload}
    AdminPage.Click On Save Button