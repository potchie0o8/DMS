<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ComplaintMgt.aspx.cs" Inherits="Admin_ComplaintMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Complaints Management</h1>
    <p>
    <asp:GridView ID="grdComplaint" runat="server" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ComplaintID" 
            DataSourceID="SD_Complaints" ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="grdComplaint_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ComplaintID" HeaderText="Complain No" 
                InsertVisible="False" ReadOnly="True" SortExpression="ComplaintID" />
            <asp:BoundField DataField="FullName" HeaderText="Complainant" ReadOnly="True" 
                SortExpression="FullName" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" 
                SortExpression="Subject" />
            <asp:BoundField DataField="Date" DataFormatString="{0:MMMM dd,yyyy hh:mm tt}" 
                HeaderText="Date" SortExpression="Date" />
            <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
            <%# getStatus(int.Parse(Eval("Status").ToString())) %>
            </ItemTemplate>
            </asp:TemplateField>
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
        <asp:SqlDataSource ID="SD_Complaints" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT Complaints.ComplaintID, Tenants.LName + ',  ' + Tenants.FName + '  ' + Tenants.MName AS 'FullName', Complaints.Subject, Complaints.Date, Complaints.Status FROM Complaints INNER JOIN Tenants ON Complaints.TenantID = Tenants.TenantID">
        </asp:SqlDataSource>
        </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

