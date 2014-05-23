<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="TGLink.aspx.cs" Inherits="Admin_TGLink" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 113px;
        }
        .style3
        {
            width: 344px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Choosing of Guardian</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Select Tenant:</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlTenant" runat="server" DataSourceID="sql_Tenant" 
                        DataTextField="TenantName" DataValueField="TenantID" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sql_Tenant" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        
                        
                        SelectCommand="SELECT Tenants.TenantID, Tenants.LName + ',  ' 
+ Tenants.FName + '  ' + 
Tenants.MName AS 'TenantName' FROM Tenants LEFT JOIN TGLink on Tenants.TenantID = TGLink.TenantID WHERE TGLink.TenantID IS NULL">
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ddlTenant" ErrorMessage="Please select a tenant!" 
                        ForeColor="Red" ValidationGroup="TGLink"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Select Guardian:</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlGuardian" runat="server" AppendDataBoundItems="True" 
                        DataSourceID="sql_Guardian" DataTextField="GuardianName" 
                        DataValueField="GuardianID">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sql_Guardian" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        SelectCommand="SELECT GuardianID, LName + ',  ' + FName + '  ' + MName AS 'GuardianName' FROM Guardians">
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="ddlGuardian" ErrorMessage="Please select a guardian!" 
                        ForeColor="Red" ValidationGroup="TGLink"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Relationship:</td>
                <td class="style3">
                    <asp:TextBox ID="txtRelation" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtRelation" ErrorMessage="Please indicate relationship!" 
                        ForeColor="Red" ValidationGroup="TGLink"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" ValidationGroup="TGLink" />
                &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Admin/GuardianMgt.aspx" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
    <p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

