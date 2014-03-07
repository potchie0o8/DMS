<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageAccount.aspx.cs" Inherits="Admin_GenerateBilling2" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Manage Tenant Bills</h1>
    <p>
        <asp:Label ID="lblAlert" runat="server" style="color: #FF0000"></asp:Label>
    </p>
    <p>
        <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="Back" />
    &nbsp;<asp:Button ID="btnNewBill" runat="server" onclick="btnNewBill_Click" 
            Text="Create New Bill" />
    </p>
    <p><strong>Tenant: </strong>
        <asp:Label ID="lblTenant" runat="server"></asp:Label>
    </p>
    <p>View Previous Bills:
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
&nbsp;<asp:Button ID="btnRetrieveBill" runat="server" Text="Retrieve Bill" />
    </p>
<p>
    </p>
    <rsweb:ReportViewer ID="RV_Bill" runat="server" Font-Names="Verdana" 
    Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="548px">
        <LocalReport ReportPath="Admin\Accounts\Bill.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDS_GetBill" Name="DS_Bill" />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>
<asp:SqlDataSource ID="SqlDS_GetBill" runat="server" 
    ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
    SelectCommand="RetrieveBill" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="6" Name="BID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
    <p><strong>Bill Period: </strong>
        <asp:Label ID="lblBillPeriod" runat="server"></asp:Label>
    </p>

        <asp:Button ID="btnPrintBill" runat="server" Text="Print Bill" />
&nbsp;<asp:Button ID="btnRecordPayment" runat="server" onclick="btnRecordPayment_Click" 
            Text="Record Payment for this Bill" />
    </p>
    <p><strong>Total Unpaid Balance of this Tenant: </strong>
        <asp:Label ID="lblUnpaidBal" runat="server" Text="-"></asp:Label>
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

