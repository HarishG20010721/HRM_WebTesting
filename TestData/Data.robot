*** Settings ***


*** Variables ***
${URL} =  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${Browser} =  chrome

&{Login_Credentials_Positive}  UserName=Admin  Password=admin123
&{Login_Credentials_Negative}  UserName=Admin  Password=admin111

&{User_Details}  Role=ESS  Employee_Name=Harish  Status=Enable  User_Name=John Cena  Password=John@2001  Confirm_Password=John@2001

&{Employee_Details}  First_Name=Harish  Middle_Name=S  Last_Name=Gandolkar  Employee_Id=2303123

&{Claim_Details}  Amount=10000

${File_Tobe_Upload} =  C:\\Users\\2303526\\Downloads\\UploadFile.txt

*** Keywords ***
