<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewEmployee.aspx.cs" Inherits="Admin_ViewEmployee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 43%;
            height: 237px;
        }
        .auto-style2
        {
            width: 120px;
        }
        .auto-style3
        {
            width: 120px;
            height: 19px;
        }
        .auto-style4
        {
            height: 19px;
        }
        .style2
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h3>View Employee</h3>
    <table class="auto-style1" border="1">
        <tr>
            <td class="auto-style2">
                <asp:Image ID="ImgPhoto" runat="server" Width="200px" />
            </td>
            <td>
                Upload New Photo:<br>
                <asp:FileUpload ID="FupPhoto" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Employee ID:</td>
            <td>
                <asp:Label ID="lblEmpID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Date of Employment:</td>
            <td>
                <asp:TextBox ID="txtDOE" runat="server"></asp:TextBox>

                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDOE">
                </asp:CalendarExtender>
                <asp:MaskedEditExtender Mask="99/99/9999" TargetControlID="txtDOE" MaskType="Date" ID="MaskedEditExtender2" runat="server">
                </asp:MaskedEditExtender>


                <asp:RequiredFieldValidator ControlToValidate="txtDOE" 
                    ID="RequiredFieldValidator9" runat="server" 
                    CssClass="style2" ErrorMessage="Select date of employment!" 
                    ValidationGroup="UpdateEmployee" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">First Name:</td>
            <td>
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtFName" 
                    ID="RequiredFieldValidator1" runat="server" 
                    CssClass="style2" ErrorMessage="Enter first name!" 
                    ValidationGroup="UpdateEmployee" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Middle Name:</td>
            <td>
                <asp:TextBox ID="txtMName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtMName" 
                    ID="RequiredFieldValidator2" runat="server" 
                    CssClass="style2" ErrorMessage="Enter middle name!" 
                    ValidationGroup="UpdateEmployee" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name:</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtLName" 
                    ID="RequiredFieldValidator3" runat="server" 
                    CssClass="style2" ErrorMessage="Enter last name!" 
                    ValidationGroup="UpdateEmployee" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            <td>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                    <asp:ListItem Value="1">Male</asp:ListItem>
                    <asp:ListItem Value="2">Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="ddlGender" 
                    ID="RequiredFieldValidator5" runat="server" 
                    CssClass="style2" ErrorMessage="Select gender!" 
                    ValidationGroup="UpdateEmployee" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Date of Birth:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>

                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDOB">
                </asp:CalendarExtender>
                <asp:MaskedEditExtender Mask="99/99/9999" TargetControlID="txtDOB" MaskType="Date" ID="MaskedEditExtender1" runat="server">
                </asp:MaskedEditExtender>



                <asp:RequiredFieldValidator ControlToValidate="txtDOB" 
                    ID="RequiredFieldValidator4" runat="server" 
                    CssClass="style2" ErrorMessage="Enter date of birth!" 
                    ValidationGroup="UpdateEmployee" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Contact No.</td>
            <td>
                <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtContactNo" 
                    ID="RequiredFieldValidator6" runat="server" 
                    CssClass="style2" ErrorMessage="Enter contact number!" 
                    ValidationGroup="UpdateEmployee" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email Address:</td>
            <td>
                <asp:TextBox ID="txtEmailAdd" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtEmailAdd" 
                    ID="RequiredFieldValidator7" runat="server" 
                    CssClass="style2" ErrorMessage="Enter email address!" 
                    ValidationGroup="UpdateEmployee" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ControlToValidate="txtEmailAdd" 
                    ID="RegularExpressionValidator1" runat="server" 
                    CssClass="style2" ErrorMessage="Email address is not valid!" 
                    ValidationGroup="UpdateEmployee" Display="Dynamic" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Username:</td>
            <td>
                <asp:Label ID="lblUN" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">- Reset Password -</td>
            <td class="auto-style4">
                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" OnClick="btnResetPassword_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Has Admin Access?</td>
            <td>
                <asp:DropDownList ID="ddlAdminAccess" runat="server">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                    <asp:ListItem Value="1">Full</asp:ListItem>
                    <asp:ListItem Value="2">Limited</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="ddlAdminAccess" 
                    ID="RequiredFieldValidator8" runat="server" 
                    CssClass="style2" ErrorMessage="Select admin restriction level" 
                    ValidationGroup="UpdateEmployee" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        </table>

     <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        HeaderText="Employee infomation updates can't be saved. Please review the following:" 
        style="color: #FF0000" ValidationGroup="UpdateEmployee" />
    <br />

     <asp:Label ID="lblAlert" runat="server" style="color: #FF0000"></asp:Label>

     <br />
     <asp:Button ID="btnUpdate" runat="server" Text="Update Employee" 
        OnClick="btnUpdate_Click" ValidationGroup="UpdateEmployee" OnClientClick="if(Page_ClientValidate()){ this.disabled = true; this.value = 'Loading...';}" UseSubmitBehavior="false" />

    <asp:ConfirmButtonExtender ID="btnUpdate_ConfirmButtonExtender" runat="server" 
        ConfirmText="Are you sure you want to update this employee's information?" 
        TargetControlID="btnUpdate">
    </asp:ConfirmButtonExtender>

    <p>&nbsp;</p>

    <asp:ModalPopupExtender ID="MPEResetPass" TargetControlID="btnResetPassword" PopupControlID="ResetPWDPanel" CancelControlID="btnCancel" runat="server">
    </asp:ModalPopupExtender>

    <asp:Panel ID="ResetPWDPanel" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Dotted">
    Are you sure you want to reset this employee's password?<br />
    <br />
    Enter your password to confirm: 
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
            ControlToValidate="txtPassword" ErrorMessage="Please enter your password!" 
            style="color: #FF0000" ValidationGroup="ResetPass" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnResetPass2" runat="server" 
            Text="Confirm and go reset this employee's password!" 
            onclick="btnResetPass2_Click" ValidationGroup="ResetPass" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
    </asp:Panel>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

