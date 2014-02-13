<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageAssets.aspx.cs" Inherits="Admin_ManageAssets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Manage Tenants' Assets</h1>
    <p>
     <asp:Button ID="btnAddAsset" runat="server" Text="Register an Asset" PostBackUrl="~/Admin/RegAsset.aspx" />

        <asp:GridView ID="Grd_Assets" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="AssetID" DataSourceID="SqlDS_Assets" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            onselectedindexchanged="Grd_Assets_SelectedIndexChanged">
            <Columns>
                <%--<asp:BoundField DataField="TenantID" HeaderText="TenantID" 
                    SortExpression="TenantID" />--%>
                <asp:BoundField DataField="AssetID" HeaderText="AssetID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="AssetID" />
                <asp:TemplateField HeaderText="Owner">
                    <ItemTemplate>
                        <%# ReturnFullName(int.Parse(Eval("TenantID").ToString())) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="AssetType" HeaderText="Asset Type" 
                    SortExpression="AssetType" />
                <asp:BoundField DataField="ModelName" HeaderText="Model Name" 
                    SortExpression="ModelName" />
                <asp:BoundField DataField="BrandName" HeaderText="Brand" 
                    SortExpression="BrandName" />
                <asp:BoundField DataField="SerialNo" HeaderText="Serial No." 
                    SortExpression="SerialNo" />
                <asp:BoundField DataField="Amount" HeaderText="Monthly Fee" 
                    SortExpression="Amount" />
                <asp:CheckBoxField DataField="IsIn" HeaderText="Is In" SortExpression="IsIn" />
                <asp:CommandField ButtonType="Button" SelectText="Manage" 
                    ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDS_Assets" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT * FROM [Assets]"></asp:SqlDataSource>
    </p>
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

