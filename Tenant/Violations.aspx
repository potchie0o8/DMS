<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/TenantMaster.master" AutoEventWireup="true" CodeFile="Violations.aspx.cs" Inherits="Tenant_Violations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Violations</h1>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" DataKeyNames="ViolationID" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Fine" HeaderText="Fine" 
                    SortExpression="Fine" />
                <asp:BoundField DataField="DateTime" 
                    DataFormatString="{0:MMMM dd,yyyy}" HeaderText="Date" 
                    SortExpression="DateTime" />
                <asp:BoundField DataField="Name" HeaderText="Employee Name" ReadOnly="True" 
                    SortExpression="Name" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            
            SelectCommand="SELECT Violations.Title, Violations.Fine, Violations.DateTime, Employees.LName + ',  ' + Employees.FName + '  ' + Employees.MName AS Name, Violations.ViolationID FROM Violations INNER JOIN Employees ON Violations.EmployeeID = Employees.EmployeeID WHERE (Violations.TenantID = @TenantID)">
            <SelectParameters>
                <asp:SessionParameter Name="TenantID" SessionField="TenantID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

