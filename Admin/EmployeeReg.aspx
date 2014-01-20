<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="EmployeeReg.aspx.cs" Inherits="Admin_EmployeeReg" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

    <table style="width:100%;">
        <tr>
            <td class="style1" colspan="3">
                <h1>
                    Employee Registration</h1>
            </td>
        </tr>
        <tr>
            <td class="style1">
                First Name</td>
            <td class="style2">
                <asp:TextBox ID="txtFName" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Middle Name</td>
            <td class="style2">
                <asp:TextBox ID="txtMName" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Last Name</td>
            <td class="style2">
                <asp:TextBox ID="txtLName" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Gender</td>
            <td class="style2">
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                    <asp:ListItem Value="1">Male</asp:ListItem>
                    <asp:ListItem Value="2">Female</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Birthday</td>
            <td class="style2">
               
                <asp:TextBox ID="txtBDay" runat="server" Width="180px" ValidationGroup="BdayVal" Placeholder="-Click to Pick Date-"></asp:TextBox>
                 <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtBDay">
                </asp:CalendarExtender>
                <asp:MaskedEditExtender Mask="99/99/9999" TargetControlID="txtBDay" MaskType="Date" ID="MaskedEditExtender1" runat="server">
                </asp:MaskedEditExtender>


            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Contact No</td>
            <td class="style2">
                <asp:TextBox ID="txtContact" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Email</td>
            <td class="style2">
                <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Admin Level</td>
            <td class="style2">
                <asp:DropDownList ID="ddlAdminLevel" runat="server">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                    <asp:ListItem Value="1">Full</asp:ListItem>
                    <asp:ListItem Value="2">Limited</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Username</td>
            <td class="style2">
                <asp:TextBox ID="txtUN" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Password</td>
            <td class="style2">
                <asp:TextBox ID="txtPwd1" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Repeat Password</td>
            <td class="style2">
                <asp:TextBox ID="txtPwd2" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPwd1" ControlToValidate="txtPwd2" 
                    ErrorMessage="Password not match"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Date of Employment</td>
            <td class="style2">
                <asp:TextBox ID="txtDateEmployeed" runat="server" Width="180px" Placeholder="-Click to Pick Date-"></asp:TextBox>

                 <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDateEmployeed">
                </asp:CalendarExtender>
                <asp:MaskedEditExtender Mask="99/99/9999" TargetControlID="txtDateEmployeed" MaskType="Date" ID="MaskedEditExtender2" runat="server">
                </asp:MaskedEditExtender>

            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <div>
    
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>
