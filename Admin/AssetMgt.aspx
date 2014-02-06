<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="AssetMgt.aspx.cs" Inherits="Admin_AssetMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Assets Management</h1>
    <p>
        <asp:Button ID="btnReg" runat="server" PostBackUrl="~/Admin/RegAsset.aspx" Text="Register New Asset" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="TenantID" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="TenantID" HeaderText="Tenant ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="TenantID" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                    SortExpression="Name" />
                <asp:BoundField DataField="AssetType" HeaderText="Asset Type" 
                    SortExpression="AssetType" />
                <asp:BoundField DataField="ModelName" HeaderText="Model Name" 
                    SortExpression="ModelName" />
                <asp:BoundField DataField="BrandName" HeaderText="Brand Name" 
                    SortExpression="BrandName" />
                <asp:BoundField DataField="SerialNo" HeaderText="Serial No" 
                    SortExpression="SerialNo" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT Tenants.TenantID, Tenants.LName + ', ' + Tenants.FName + '  ' + Tenants.MName AS 'Name', Assets.AssetType, Assets.ModelName, Assets.BrandName, Assets.SerialNo, Assets.Amount FROM Assets INNER JOIN Tenants ON Assets.TenantID = Tenants.TenantID">
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

