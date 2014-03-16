<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/Guardian.master" AutoEventWireup="true" CodeFile="DTRMgt.aspx.cs" Inherits="Guardian_DTRMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 107px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Tenants DTR</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Select a Tenant:</td>
                <td>
                    <asp:DropDownList ID="ddlTenant" runat="server" DataSourceID="sql_Tenant" 
                        DataTextField="TenantName" DataValueField="TenantID" 
                        AppendDataBoundItems="True">
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
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
    </p>
    <asp:GridView ID="grdDRT" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="sql_DTR" ForeColor="#333333" 
        GridLines="None" EmptyDataText="-Please select a tenant.-">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="TenantName" HeaderText="Tenant Name" ReadOnly="True" 
                SortExpression="TenantName" />
            <asp:BoundField DataField="EntryType" HeaderText="Entry Type" 
                SortExpression="EntryType" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                SortExpression="Remarks" />
            <asp:BoundField DataField="DateTime" HeaderText="Date Time" 
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
    <asp:SqlDataSource ID="sql_DTR" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>">
        <%--<SelectParameters>
            <asp:ControlParameter ControlID="ddlTenant" Name="TID" 
                PropertyName="SelectedValue" />
        </SelectParameters>--%>
    </asp:SqlDataSource>
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

