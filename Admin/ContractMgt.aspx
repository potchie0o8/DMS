<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ContractMgt.aspx.cs" Inherits="Admin_ContractMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Contract Management</h1>

    <p>Select a Tenant:
        <asp:DropDownList ID="ddlSelectTenant" runat="server" 
            AppendDataBoundItems="True" DataSourceID="SqlDS_Tenants" 
            DataTextField="SUMMARY" DataValueField="TenantID">
            <asp:ListItem Value="">--Select a Tenant--</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDS_Tenants" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT TenantID, LName + ', ' + FName + ' ' + MName + ' - ' + CASE Gender WHEN 1 THEN 'Male' ELSE 'Female' END + '(' + CONVERT (NVARCHAR(10), TenantID) + ')' AS 'SUMMARY' FROM Tenants ORDER BY LName">
        </asp:SqlDataSource>
         <asp:Button ID="btnAddContract" runat="server" PostBackUrl="~/Admin/Contract.aspx" Text="Add a Contract" />
    </p>
    <p>
        <asp:ListView ID="ListView_Contracts" runat="server">
        </asp:ListView>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

