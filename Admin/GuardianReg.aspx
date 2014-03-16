<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="GuardianReg.aspx.cs" Inherits="Admin_GuardianReg" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 116px;
        }
        .style3
        {
            width: 116px;
            height: 18px;
        }
        .style4
        {
            height: 18px;
        }
        .style5
        {
            width: 541px;
        }
        .style6
        {
            height: 18px;
            width: 541px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Guardian Registration</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    First Name:</td>
                <td class="style5">
                    <asp:TextBox ID="textFname" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="textFname" ErrorMessage="Please indicate First Name!" 
                        ForeColor="Red" ValidationGroup="RegGuardian"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Middle Name:</td>
                <td class="style5">
                    <asp:TextBox ID="textMname" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="textMname" ErrorMessage="Please indicate Middle Name!" 
                        ForeColor="Red" ValidationGroup="RegGuardian"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Last Name:</td>
                <td class="style5">
                    <asp:TextBox ID="textLname" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="textLname" ErrorMessage="Please indicate Last Name!" 
                        ForeColor="Red" ValidationGroup="RegGuardian"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Gender:</td>
                <td class="style5">
                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="ddlGender" ErrorMessage="Please select Gender!" 
                        ForeColor="Red" ValidationGroup="RegGuardian"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Birthday:</td>
                <td class="style5">
                    <asp:TextBox ID="textBirthday" runat="server" Width="180px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="textBirthday_MaskedEditExtender" runat="server"  
                        Mask="99/99/9999" MaskType="Date" TargetControlID="textBirthday">
                    </asp:MaskedEditExtender>
                    <asp:CalendarExtender ID="textBirthday_CalendarExtender" runat="server" 
                        TargetControlID="textBirthday">
                    </asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="textBirthday" ErrorMessage="Please indicate Birthdate!" 
                        ForeColor="Red" ValidationGroup="RegGuardian"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Contact No.:</td>
                <td class="style5">
                    <asp:TextBox ID="textContactNo" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="textContactNo" ErrorMessage="Please indicate Contact No.!" 
                        ForeColor="Red" ValidationGroup="RegGuardian"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Email:</td>
                <td class="style5">
                    <asp:TextBox ID="textEmail" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="textEmail" ErrorMessage="Please indicate Email Address!" 
                        ForeColor="Red" ValidationGroup="RegGuardian"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Address:</td>
                <td class="style5">
                    <asp:TextBox ID="textSaddress" runat="server" Width="180px" 
                        TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="textSaddress" ErrorMessage="Please indicate Street Address!" 
                        ForeColor="Red" ValidationGroup="RegGuardian"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Username:</td>
                <td class="style6">
                    <asp:TextBox ID="textUname" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="textUname" ErrorMessage="Please indicate Username!" 
                        ForeColor="Red" ValidationGroup="RegGuardian"></asp:RequiredFieldValidator>
                </td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Password:</td>
                <td class="style5">
                    <asp:TextBox ID="textPassword" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="textPassword" ErrorMessage="Please indicate Password!" 
                        ForeColor="Red" ValidationGroup="RegGuardian"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Repeat Password:</td>
                <td class="style5">
                    <asp:TextBox ID="textRPassword" runat="server" Width="180px" 
                        TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToValidate="textRPassword" ErrorMessage="Password do not match!" 
                        ForeColor="Red" ValidationGroup="RegGuardian" 
                        ControlToCompare="textPassword">Password do no match!</asp:CompareValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        ValidationGroup="RegGuardian" onclick="btnSubmit_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Admin/GuardianMgt.aspx" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

