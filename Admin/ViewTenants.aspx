<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewTenants.aspx.cs" Inherits="Admin_ViewTenants" %>
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
    <h3>View Tenant</h3>
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
            <td class="auto-style2">Tenant ID:</td>
            <td>
                <asp:Label ID="lblTenantID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Contract ID:</td>
            <td>
                <asp:Label ID="lblContractID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Fingerprint ID:</td>
            <td>
                <asp:TextBox ID="txtFPID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">First Name:</td>
            <td>
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtFName" 
                    ID="RequiredFieldValidator1" runat="server" 
                    CssClass="style2" ErrorMessage="Please indicate First Name!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Middle Name:</td>
            <td>
                <asp:TextBox ID="txtMName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtMName" 
                    ID="RequiredFieldValidator2" runat="server" 
                    CssClass="style2" ErrorMessage="Please indicate Middle Name!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name:</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtLName" 
                    ID="RequiredFieldValidator3" runat="server" 
                    CssClass="style2" ErrorMessage="Please indicate Last Name!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            <td>
                <asp:DropDownList ID="ddlGender" runat="server" Height="16px">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                    <asp:ListItem Value="1">Male</asp:ListItem>
                    <asp:ListItem Value="2">Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="ddlGender" 
                    ID="RequiredFieldValidator5" runat="server" 
                    CssClass="style2" ErrorMessage="Please select gender!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
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
                    CssClass="style2" ErrorMessage="Please indicate Date of Birth!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Contact No.</td>
            <td>
                <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtContactNo" 
                    ID="RequiredFieldValidator6" runat="server" 
                    CssClass="style2" ErrorMessage="Please indicate Contact No.!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email Address:</td>
            <td>
                <asp:TextBox ID="txtEmailAdd" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtEmailAdd" 
                    ID="RequiredFieldValidator7" runat="server" 
                    CssClass="style2" ErrorMessage="Please indicate email address!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ControlToValidate="txtEmailAdd" 
                    ID="RegularExpressionValidator1" runat="server" 
                    CssClass="style2" ErrorMessage="Email address is not valid!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Street:</td>
            <td>
                <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtStreet" 
                    ID="RequiredFieldValidator11" runat="server" 
                    CssClass="style2" ErrorMessage="Please indicate Street!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">City/Province:</td>
            <td>
                <asp:TextBox ID="txtCityProvince" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtCityProvince" 
                    ID="RequiredFieldValidator12" runat="server" 
                    CssClass="style2" ErrorMessage="Please indicate City or Province!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Region:</td>
            <td>
                <asp:TextBox ID="txtRegion" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtRegion" 
                    ID="RequiredFieldValidator13" runat="server" 
                    CssClass="style2" ErrorMessage="Please indicate Region!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Country:</td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtCountry" 
                    ID="RequiredFieldValidator14" runat="server" 
                    CssClass="style2" ErrorMessage="Please indicate Country!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
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
                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" 
                    OnClick="btnResetPassword_Click" ValidationGroup="ResetPass" />
            </td>
        </tr>
        </table>

     <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        HeaderText="Employee infomation updates can't be saved. Please review the following:" 
        style="color: #FF0000" ValidationGroup="UpdateEmployee" />
    <br />

     <asp:Label ID="lblAlert" runat="server" style="color: #FF0000"></asp:Label>

     <br />
     <asp:Button ID="btnUpdate" runat="server" Text="Update Tenant" 
        OnClick="btnUpdate_Click" ValidationGroup="UpdateTenant" 
    OnClientClick="if(Page_ClientValidate()){ this.disabled = true; this.value = 'Loading...';}" 
    UseSubmitBehavior="false" />

    &nbsp;&nbsp;&nbsp;

    <asp:ConfirmButtonExtender ID="btnUpdate_ConfirmButtonExtender" runat="server" 
        ConfirmText="Are you sure you want to update this tenant's information?" 
        TargetControlID="btnUpdate">
    </asp:ConfirmButtonExtender>

    <asp:Button ID="btnDelete" runat="server" Text="Delete" 
        onclick="btnDelete_Click"/>
    <asp:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" 
                        ConfirmText="Are you sure you want to delete this announcement?" 
                        TargetControlID="btnDelete">
                    </asp:ConfirmButtonExtender>
&nbsp;&nbsp;

    <p>
        <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Admin/ManageTenants.aspx" />
    </p>

    <asp:ModalPopupExtender ID="MPEResetPass" TargetControlID="btnResetPassword" PopupControlID="ResetPWDPanel" CancelControlID="btnCancel" runat="server">
    </asp:ModalPopupExtender>

    <asp:Panel ID="ResetPWDPanel" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Dotted">
        <br />
        Enter your new password to confirm: 
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
            ControlToValidate="txtPassword" ErrorMessage="Please indicate your password!" 
            style="color: #FF0000" ValidationGroup="ResetPass" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnResetPass2" runat="server" 
            Text="Confirm and go reset this tenant's password!" 
            onclick="btnResetPass2_Click" ValidationGroup="ResetPass" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
    </asp:Panel>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

