<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/Guardian.master" AutoEventWireup="true" CodeFile="ViolationMgt.aspx.cs" Inherits="Guardian_ViolationMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 107px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Tenants Violations</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Select a Tenant:</td>
                <td>
                    <asp:DropDownList ID="ddlTenant" runat="server" DataTextField="TenantName" DataValueField="TenantID" 
                        AppendDataBoundItems="True" DataSourceID="sql_Tenant">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sql_Tenant" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        SelectCommand="SELECT TGLink.TenantID, Tenants.LName + ',  ' + Tenants.FName + '  ' + Tenants.MName AS 'TenantName' FROM Tenants INNER JOIN TGLink ON Tenants.TenantID = TGLink.TenantID INNER JOIN Guardians ON TGLink.GuardianID = @GID">
                        <SelectParameters>
                            <asp:SessionParameter Name="GID" SessionField="GuardianID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="btnView" runat="server" Text="View" onclick="btnView_Click" />
&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
    </p>
    <p>
        <asp:GridView ID="grdViolations" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="sql_Violation" 
            EmptyDataText="- Please select a tenant. -" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="TenantName" HeaderText="TenantName" ReadOnly="True" 
                    SortExpression="TenantName" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Fine" HeaderText="Fine" SortExpression="Fine" />
                <asp:BoundField DataField="DateTime" HeaderText="DateTime" 
                    SortExpression="DateTime" />
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
        <asp:SqlDataSource ID="sql_Violation" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>">
        <%--<SelectParameters>
            <asp:ControlParameter ControlID="ddlTenant" Name="TID" 
                PropertyName="SelectedValue" />
        </SelectParameters>--%>
    </asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

