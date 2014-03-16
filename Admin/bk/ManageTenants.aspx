<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageTenants.aspx.cs" Inherits="Admin_ManageTenants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Tenants Management Page</h1>
    <p>
        <asp:Button ID="btnAddTenant" runat="server" 
            PostBackUrl="~/Admin/TenantReg.aspx" Text="Add New Tenant" />
    </p>
<br>
    <asp:GridView ID="GrdTenants" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="TenantID" 
        DataSourceID="SqlDS_Tenants" 
        onselectedindexchanged="GrdTenants_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="TenantID" HeaderText="TenantID" 
                InsertVisible="False" ReadOnly="True" SortExpression="TenantID" />
            <asp:BoundField DataField="FName" HeaderText="First Name" 
                SortExpression="FName" />
            <asp:BoundField DataField="MName" HeaderText="Middle Name" 
                SortExpression="MName" />
            <asp:BoundField DataField="LName" HeaderText="Last Name" 
                SortExpression="LName" />
           <%-- <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />--%>
            <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
            <ItemTemplate>
            <%# getGender(int.Parse(Eval("Gender").ToString())) %>
            </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="DateRegistered" HeaderText="Date Registered" 
                SortExpression="DateRegistered" />
            <asp:CommandField ButtonType="Button" SelectText="View/Edit" 
                ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDS_Tenants" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
        SelectCommand="SELECT * FROM [Tenants] ORDER BY DateRegistered DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

