<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageTenants.aspx.cs" Inherits="Admin_ManageTenants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Tenants Management Page</h1>
    <p>
        <asp:Button ID="btnAddTenant" runat="server" 
            PostBackUrl="~/Admin/TenantReg.aspx" Text="Add New Tenant" />
    </p>
    <p>
<<<<<<< HEAD
        Select Category:
        <asp:DropDownList ID="ddlSearch" runat="server">
            <asp:ListItem Value="">--Select Search Category--</asp:ListItem>
            <asp:ListItem Value="UN">Username</asp:ListItem>
            <asp:ListItem Value="TenantID">Tenant ID</asp:ListItem>
=======
        Select Category:<asp:DropDownList ID="ddlSearch" runat="server">
            <asp:ListItem Value="">--Select Search Category--</asp:ListItem>
            <asp:ListItem Value="UN">Username</asp:ListItem>
            <asp:ListItem Value="TenantID">Tenant No.</asp:ListItem>
>>>>>>> eeef0f989f9b95b8b161b5956eb59a7441d4bc8d
            <asp:ListItem Value="FName">First Name</asp:ListItem>
            <asp:ListItem Value="MName">Middle Name</asp:ListItem>
            <asp:ListItem Value="LName">Last Name</asp:ListItem>
        </asp:DropDownList>
<<<<<<< HEAD
    &nbsp; Search Field:
        <asp:TextBox ID="txtSearch" runat="server" Width="236px" placeholder="Leave blank to filter entries."></asp:TextBox>
&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" 
        onclick="btnSearch_Click" />
    </p>
=======
        Search Field:<asp:TextBox ID="txtSearch" runat="server" Width="236px" placeholder="Leave blank to filter entries."></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" 
        onclick="btnSearch_Click" />
    </p>
<br>
>>>>>>> eeef0f989f9b95b8b161b5956eb59a7441d4bc8d
    <asp:GridView ID="GrdTenants" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TenantID" 
        DataSourceID="SqlDS_Tenants" 
        onselectedindexchanged="GrdTenants_SelectedIndexChanged" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="TenantID" HeaderText="TenantID" 
                InsertVisible="False" ReadOnly="True" SortExpression="TenantID" />
            <asp:BoundField DataField="FName" HeaderText="First Name" 
                SortExpression="FName" />
            <asp:BoundField DataField="MName" HeaderText="Middle Name" 
                SortExpression="MName" />
            <asp:BoundField DataField="LName" HeaderText="Last Name" 
                SortExpression="LName" />
            <asp:BoundField DataField="UN" HeaderText="Username" 
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
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDS_Tenants" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
        SelectCommand="SELECT * FROM [Tenants] ORDER BY DateRegistered DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

