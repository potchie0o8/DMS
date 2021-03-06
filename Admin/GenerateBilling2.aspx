﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="GenerateBilling2.aspx.cs" Inherits="Admin_GenerateBilling2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 44%;
            height: 98px;
        }
        .style3
        {
            width: 110px;
        }
        .style4
        {
            height: 23px;
        }
        .style5
        {}
        .style6
        {
            text-decoration: underline;
        }
        .style7
        {
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
    </p>
    <p><strong>Tenant: </strong>
        <asp:Label ID="lblTenant" runat="server"></asp:Label>
    </p>
    <p>View Previous Bills:
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
&nbsp;<asp:Button ID="btnRetrieveBill" runat="server" Text="Retrieve Bill" />
    </p>
    <p><strong>Bill Period: </strong>
        <asp:Label ID="lblBillPeriod" runat="server"></asp:Label>
    </p>
    <p>Bill Particulars:</p>
    <p>
        <asp:GridView ID="GrdOldBillView" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ItemID" DataSourceID="SqlDS_OldBills" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ItemID" />
                <asp:BoundField DataField="BillID" HeaderText="BillID" 
                    SortExpression="BillID" />
                <asp:BoundField DataField="Particular" HeaderText="Particular" 
                    SortExpression="Particular" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDS_OldBills" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT * FROM [BillI_Items]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="btnPrintBill" runat="server" Text="Print Bill" />
&nbsp;<asp:Button ID="btnRecordPayment" runat="server" onclick="btnRecordPayment_Click" 
            Text="Record Payment for this Bill" />
    </p>
    <p><strong>Total Unpaid Balance of this Tenant: </strong>
        <asp:Label ID="lblUnpaidBal" runat="server" Text="-"></asp:Label>
    </p>
    <p>&nbsp;</p>
    <hr />
    <h1>Generate New Bill</h1>
    <p class="style6"><strong>Unbilled Charges (Please select to add to Bill):</strong></p>
    <table border="1" class="style2">
        <tr>
            <td class="style4" colspan="2">
                <strong>RENT CHARGES</strong></td>
            <td class="style5" rowspan="3">
                <asp:CheckBox ID="cbkAddRent" runat="server" Text="Add to Bill" />
            </td>
        </tr>
        <tr>
            <td class="style4">
                Rent Contract Type:</td>
            <td class="style5">
                <asp:Label ID="lblContract" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Rent Fee:</td>
            <td>
                <asp:Label ID="lblPeriodFee" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <table border="1" class="style2">
        <tr>
            <td class="style4">
                <strong>RECORDED VIOLATIONS</strong></td>
            <td class="style5" rowspan="2">
                <asp:CheckBox ID="cbkAddViolations" runat="server" Text="Add to Bill" />
            </td>
        </tr>
        <tr>
            <td class="style7">
        <asp:GridView ID="GRD_VIOLATIONS" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
            </td>
        </tr>
        </table>
    <br />
    <p>
        &nbsp;</p>
    <p><strong>Bill Preview:</strong></p>
    <p>
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
    </p>
    <p><strong>Total for this bill: </strong>
        <asp:Label ID="lblNewTotal" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Button ID="btnCreateBill" runat="server" Text="Create Bill" />
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

