﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageAccount.aspx.cs" Inherits="Admin_GenerateBilling2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 29%;
            height: 20px;
        }
    </style>
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
    <p>Choose Bill Period:&nbsp;
        <asp:DropDownList ID="DDLBillPeriod" runat="server" 
            DataSourceID="SqlDS_ChooseBill" DataTextField="DateGenerated" 
            DataValueField="BillID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDS_ChooseBill" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT [DateGenerated], [BillID] FROM [Bills] WHERE (([TenantID] = @TenantID) AND ([IsFinalized] = @IsFinalized)) ORDER BY DateGenerated DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="TenantID" QueryStringField="ID" Type="Int32" />
                <asp:Parameter DefaultValue="True" Name="IsFinalized" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="View Bill" />
    &nbsp;<asp:Button ID="btnRecordPayment" runat="server" onclick="btnRecordPayment_Click" 
            Text="Record Payment for this Bill" />
    </p>


    <asp:ModalPopupExtender ID="MDE_Payments" CancelControlID="btnCancelPay" TargetControlID="btnRecordPayment" PopupControlID="pnl_payment" runat="server">
    </asp:ModalPopupExtender>

<p>
    &nbsp;<asp:Panel ID="pnl_payment" runat="server" BorderColor="Black" BorderStyle="Dotted" BackColor="White" Height="200px" Width="344px">
        <h3>
            Record Bill Payment:</h3>
        <table class="style2">
            <tr>
                <td style="color: #000000">
                    Amount:</td>
                <td>
                    <asp:Label ID="lblPayAmt" runat="server" style="color: #000000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="color: #000000">
                    Payment Mode:</td>
                <td>
                    <asp:DropDownList ID="DDLPaymode0" runat="server">
                        <asp:ListItem>-Select-</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Check</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="color: #000000">
                    Additional Remarks:</td>
                <td>
                    <asp:TextBox ID="txtPayRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="color: #000000" colspan="2">
                    <asp:Button ID="btnRecPayment" runat="server" Text="Record Payment" />
                    &nbsp;<asp:Button ID="btnCancelPay" runat="server" Height="26px" Text="Cancel" />
                </td>
            </tr>
        </table>
        &nbsp;<br />
        &nbsp;<br />

    </asp:Panel>
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
    <%--<SelectParameters>
        <asp:Parameter DefaultValue="6" Name="BID" Type="Int32" />
    </SelectParameters>--%>
</asp:SqlDataSource>
    <p><strong>Bill Period: </strong>
        <asp:Label ID="lblBillPeriod" runat="server"></asp:Label>
    </p>

&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

