<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="GenerateBill.aspx.cs" Inherits="Admin_Accounts_GenerateBill" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
        .style9
        {
            height: 23px;
            text-decoration: underline;
        }
        .style10
        {
            height: 23px;
            width: 484px;
            text-decoration: underline;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>
        Generate New Bill</h1>
    <p class="style6">
        <strong>Unbilled Charges (Please select to add to Bill):</strong></p>
    <table class="style8" border="1">
        <tr>
            <td style="font-weight: 700" class="style6">
                PREVIOUS BALANCE AND PENALTIES</td>
        </tr>
        <tr>
            <td class="style4">
                <strong>Previous Unsettled Balance:</strong>&nbsp;
                <asp:Label ID="lblPrevBalance" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <table border="1" class="style2">
        <tr>
            <td class="style9" colspan="2">
                <strong>RENT CHARGES</strong></td>
        </tr>
        <tr>
            <td class="style4">
                <strong>Rent Contract Type:</strong></td>
            <td class="style5">
                <asp:Label ID="lblContract" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>Rent Fee:</strong></td>
            <td>
                <asp:Label ID="lblPeriodFee" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <table border="1" class="style2">
        <tr>
            <td class="style10">
                <strong>RECORDED VIOLATIONS</strong></td>
        </tr>
        <tr>
            <td class="style7">
                <asp:GridView ID="GRD_VIOLATIONS" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDS_Violations" 
                    DataKeyNames="Title,Fine" 
                    onselectedindexchanged="GRD_VIOLATIONS_SelectedIndexChanged" 
                    EmptyDataText="No Violations Recorded For this Tenant">
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
    <table class="style8" border="1">
        <tr>
            <td style="font-weight: 700" class="style6">
                REGISTERED ASSETS</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GRD_ASSETS" runat="server" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" DataSourceID="SqlDS_Assets" 
                    AutoGenerateColumns="False" 
                    EmptyDataText="No Assets Recorded For This Tenant " 
                    DataKeyNames="AssetType,Amount" 
                    onselectedindexchanged="GRD_ASSETS_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="AssetType" HeaderText="Asset Type" 
                            SortExpression="AssetType" />
                        <asp:BoundField DataField="Amount" HeaderText="Fee" SortExpression="Amount" />
                        <asp:CommandField SelectText="Add To Bill" ShowSelectButton="True" />
                    </Columns>
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
                <asp:SqlDataSource ID="SqlDS_Assets" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                    SelectCommand="SELECT [IsIn], [Amount], [AssetType] FROM [Assets] WHERE (([IsIn] = @IsIn) AND ([TenantID] = @TenantID))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="IsIn" Type="Boolean" />
                        <asp:QueryStringParameter Name="TenantID" QueryStringField="TID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <hr />
    <p>
        Current Bill Items<strong>:</strong></p>
    <p>
        <asp:GridView ID="GRD_BillItems" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ItemID" DataSourceID="SqlDS_Bill_Items" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Particular" HeaderText="Particular" 
                    SortExpression="Particular" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" />
                <asp:CommandField ShowSelectButton="True" />
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
        <asp:ConfirmButtonExtender ID="btnCreateBill_ConfirmButtonExtender" 
            runat="server" 
            ConfirmText="Are you sure you want to finalize this bill? Items in this bill are final and cannot be modified." 
            TargetControlID="btnCreateBill">
        </asp:ConfirmButtonExtender>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

