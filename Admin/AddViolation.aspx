<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="AddViolation.aspx.cs" Inherits="Admin_AddViolation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 99px;
        }
        .style3
        {
            width: 377px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Add New Violation</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Select Tenant</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlTenant" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="Name" 
                        DataValueField="TenantID" AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        SelectCommand="SELECT TenantID, LName + ', ' + FName + '  ' + MName AS 'Name' FROM Tenants">
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ddlTenant" ErrorMessage="Please select a Tenant!" 
                        ForeColor="Red" ValidationGroup="Violation"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Violation</td>
                <td class="style3">
                    <asp:TextBox ID="txtTitle" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtTitle" ErrorMessage="Please indicate violation!" 
                        ForeColor="Red" ValidationGroup="Violation"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Description</td>
                <td class="style3">
                    <asp:TextBox ID="txtDesc" runat="server" Width="180px" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtDesc" ErrorMessage="Please enter description!" 
                        ForeColor="Red" ValidationGroup="Violation"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Fine</td>
                <td class="style3">
                    <asp:TextBox ID="txtFine" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtFine" ErrorMessage="Please input amount!" ForeColor="Red" 
                        ValidationGroup="Violation"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" ValidationGroup="Violation" />
                &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" PostBackUrl="~/Admin/ViolationMgt.aspx" Text="Cancel" />
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

