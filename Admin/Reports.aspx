<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Admin_Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Reports Page</h1>
    <p>
        1. <asp:LinkButton ID="LinkButton3" runat="server" 
            PostBackUrl="~/Admin/Reports/TenantsList.aspx">List of Tenants</asp:LinkButton>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

