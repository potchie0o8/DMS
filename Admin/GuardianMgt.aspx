<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="GuardianMgt.aspx.cs" Inherits="Admin_GuardianMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Manage Guardian</h1>
    <h1><asp:Button ID="btnReg" runat="server" Text="Register New Guardian" 
            PostBackUrl="~/Admin/GuardianReg.aspx" />
    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnExisting" runat="server" Height="26px" 
                        Text="Choose Existing Guardian" PostBackUrl="~/Admin/TGLink.aspx" />
    </h1>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="TGID,TenantID,GuardianID" 
            DataSourceID="sql_TGLink" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="TenantID" HeaderText="Tenant ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="TenantID" />
                <asp:BoundField DataField="TenantName" HeaderText="Tenant Name" ReadOnly="True" 
                    SortExpression="TenantName" />
                <asp:BoundField DataField="GuardianID" HeaderText="Guardian ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="GuardianID" />
                <asp:BoundField DataField="GuardianName" HeaderText="Guardian Name" 
                    ReadOnly="True" SortExpression="GuardianName" />
                <asp:BoundField DataField="Relation" HeaderText="Relation" 
                    SortExpression="Relation" />
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
        <asp:SqlDataSource ID="sql_TGLink" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            
            SelectCommand="SELECT TGLink.TGID, Tenants.TenantID, Tenants.LName + ', ' + Tenants.FName + '  ' + Tenants.MName AS 'TenantName', Guardians.GuardianID, Guardians.LName + ',  ' + Guardians.FName + '  ' + Guardians.MName AS 'GuardianName', TGLink.Relation FROM TGLink INNER JOIN Tenants ON TGLink.TenantID = Tenants.TenantID INNER JOIN Guardians ON TGLink.GuardianID = Guardians.GuardianID">
        </asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

