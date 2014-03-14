<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/TenantMaster.master" AutoEventWireup="true" CodeFile="ServiceRequestMgt.aspx.cs" Inherits="Tenant_ServiceRequestMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1> Request Management</h1>
    <p> 
        <asp:Button ID="Button1" runat="server" Text="Submit New Service Request" PostBackUrl="~/Tenant/ServiceRequest.aspx" />
    </p>
    <p> 
        <asp:GridView ID="grd_ServiceRequest" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="ServiceRequestID" 
            DataSourceID="sdb_ServiceRequest" ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="grd_ServiceRequest_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                    SortExpression="Remarks" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" 
                    SortExpression="Priority" />
                <asp:BoundField DataField="DateRequested" 
                    DataFormatString="{0: MMMM dd,yyyy hh:mm tt}" HeaderText="DateRequested" 
                    SortExpression="DateRequested" />
                <asp:CommandField ButtonType="Button" SelectText="View" 
                    ShowSelectButton="True" />
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
        <asp:SqlDataSource ID="sdb_ServiceRequest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT ServiceRequestID, Title, Remarks, Priority, DateRequested FROM ServiceRequest">
        </asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

