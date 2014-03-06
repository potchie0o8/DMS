<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="GenerateBill.aspx.cs" Inherits="Admin_Accounts_GenerateBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">

        .style6
        {
            text-decoration: underline;
        }
        .style2
        {
            width: 44%;
            height: 98px;
        }
        .style4
        {
            height: 23px;
        }
        .style3
        {
            width: 110px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>
        Generate New Bill</h1>
    <p class="style6">
        <strong>Unbilled Charges (Please select to add to Bill):</strong></p>
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
    <p>
        <strong>Bill Preview:</strong></p>
    <p>
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
    </p>
    <p>
        <strong>Total for this bill: </strong>
        <asp:Label ID="lblNewTotal" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Button ID="btnCreateBill" runat="server" Text="Create Bill" />
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

