<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="TenantsList.aspx.cs" Inherits="Admin_Reports_TenantsList" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Tenants Master List</h1>
<p></p>
<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="627px" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="718px">
    <LocalReport ReportPath="Admin\Reports\TenantMasterList.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="SqlDSTenantsMaster" 
                Name="DSTenantMasterList" />
        </DataSources>
    </LocalReport>
</rsweb:ReportViewer>
    <asp:SqlDataSource ID="SqlDSTenantsMaster" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
        SelectCommand="GetTenantList" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

