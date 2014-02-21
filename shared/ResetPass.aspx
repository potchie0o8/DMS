<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPass.aspx.cs" Inherits="shared_ResetPass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Reset my Password</h1>
       

        <p>Please enter your username and the system shall automatically generate you a new 
        password. Your new password shall be sent to your new email.</p>
        <p>Enter your username here:
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtUsername" ErrorMessage="Enter your username!" 
                style="color: #FF0000"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblAlert" runat="server" style="color: #CC0000"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnResetPass" runat="server" onclick="btnResetPass_Click" 
                Text="Reset My Password" />
        </p>
        
        
        
        </div>
    </form>
</body>
</html>
