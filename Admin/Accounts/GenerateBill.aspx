<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="GenerateBill.aspx.cs" Inherits="Admin_Accounts_GenerateBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">

        .style6
        {
            text-decoration: underline;
        }
        .style2
        {
            width: 62%;
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
        .style7
        {
            height: 23px;
            width: 484px;
        }
        .style8
        {
            width: 62%;
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
                <asp:LinkButton ID="lnkBtnAddRent" runat="server" onclick="lnkBtnAddRent_Click">Add Rent to Bill</asp:LinkButton>
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
            <td class="style7">
                <strong>RECORDED VIOLATIONS</strong></td>
        </tr>
        <tr>
            <td class="style7">
                <asp:GridView ID="GRD_VIOLATIONS" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDS_Violations">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Violation:" 
                            SortExpression="Title" />
                        <asp:BoundField DataField="Fine" HeaderText="Fine:" 
                            SortExpression="Fine" />
                        <asp:BoundField DataField="UN" HeaderText="Recorded By:" SortExpression="UN" />
                        <asp:BoundField DataField="DateTime" HeaderText="Violation Date:" 
                            SortExpression="DateTime" />
                        <asp:CommandField SelectText="Add To Bill" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="SqlDS_Violations" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" >
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="" Name="TID" QueryStringField="TID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <table class="style8">
        <tr>
            <td style="font-weight: 700">
                REGISTERED ASSETS</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GRD_ASSETS" runat="server" CellPadding="4" 
                    ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <br />
    <table class="style8">
        <tr>
            <td style="font-weight: 700">
                PREVIOUS BALANCE</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <p>
        Current Bill Items<strong>:</strong></p>
    <p>
        <asp:GridView ID="GRD_BillItems" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ItemID" DataSourceID="SqlDS_Bill_Items">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ItemID" />
                <asp:BoundField DataField="BillID" HeaderText="BillID" 
                    SortExpression="BillID" />
                <asp:BoundField DataField="Particular" HeaderText="Particular" 
                    SortExpression="Particular" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDS_Bill_Items" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT * FROM [Bill_Items] WHERE ([BillID] = @BillID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="BillID" QueryStringField="BID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <strong>Total for this bill: </strong>
        <asp:Label ID="lblNewTotal" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Button ID="btnCreateBill" runat="server" Text="Create Bill" 
            onclick="btnCreateBill_Click" />
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

