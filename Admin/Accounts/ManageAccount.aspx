<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageAccount.aspx.cs" Inherits="Admin_GenerateBilling2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 29%;
            height: 20px;
        }
        .style3
        {
            height: 23px;
        }
        .style4
        {
            height: 23px;
            font-weight: bold;
        }
        .style5
        {
            text-decoration: underline;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Manage Tenant Account</h1>
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
        <h3 class="style5">
            Record Bill Payment:</h3>
        <table class="style2">
            <tr>
                <td style="color: #000000" class="style4">
                    Amount:</td>
                <td class="style3">
                    <asp:Label ID="lblPayAmt" runat="server" style="color: #000000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="color: #000000">
                    <b>Payment Mode:</b></td>
                <td>
                    <asp:DropDownList ID="DDLPaymode" runat="server">
                        <asp:ListItem>-Select-</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Check</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="DDLPaymode" Display="Dynamic" 
                        ErrorMessage="Select Payment Mode!" style="color: #FF3300" 
                        ValidationGroup="RecordPayment"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="color: #000000">
                    <b>Additional Remarks:</b></td>
                <td>
                    <asp:TextBox ID="txtPayRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="color: #000000" colspan="2">
                    <asp:Button ID="btnRecPayment" runat="server" onclick="btnRecPayment_Click" 
                        Text="Record Payment" ValidationGroup="RecordPayment" />
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

