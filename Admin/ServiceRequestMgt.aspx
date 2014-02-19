<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ServiceRequestMgt.aspx.cs" Inherits="Admin_ServiceRequestMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Service Request Management</h1>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            DataKeyNames="ServiceRequestID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Details" HeaderText="Details" 
                    SortExpression="Details" />
                <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                    SortExpression="Remarks" />
                <asp:BoundField DataField="Priority" 
                    HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="DateRequested" DataFormatString="{0:MMMM dd, yyyy}" 
                    HeaderText="Date Requested" SortExpression="DateRequested" />
                <asp:BoundField DataField="DateCompleted" DataFormatString="{0:MMMM dd, yyyy}" 
                    HeaderText="Date Completed" SortExpression="DateCompleted" />
                <asp:CommandField ButtonType="Button" SelectText="View/Update" 
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            
            SelectCommand="SELECT ServiceRequest.ServiceRequestID, Tenants.LName + ', ' + Tenants.FName + '  ' + Tenants.MName AS 'Name', ServiceRequest.Title, ServiceRequest.Details, ServiceRequest.Remarks, ServiceRequest.Priority, ServiceRequest.DateRequested, ServiceRequest.DateCompleted FROM ServiceRequest INNER JOIN Tenants ON ServiceRequest.TenantID = Tenants.TenantID">
        </asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

