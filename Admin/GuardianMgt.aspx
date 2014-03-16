<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="GuardianMgt.aspx.cs" Inherits="Admin_GuardianMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 92px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Manage Guardian</h1>
    <h1><asp:Button ID="btnReg" runat="server" Text="Register New Guardian" 
            PostBackUrl="~/Admin/GuardianReg.aspx" />
    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnExisting" runat="server" Height="26px" 
                        Text="Choose Existing Guardian" PostBackUrl="~/Admin/TGLink.aspx" />
    </h1>
    <h2>Registered Tenants with Guardians</h2>
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
    <h2>List of Registered Guardian</h2>
    <p>
        <asp:GridView ID="grdGuardian" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="GuardianID" DataSourceID="sql_Guardian" 
            ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="grdGuardian_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="GuardianID" HeaderText="Guardian ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="GuardianID" />
                <asp:BoundField DataField="GuardianName" HeaderText="Name" ReadOnly="True" 
                    SortExpression="GuardianName" />
                <asp:BoundField DataField="UN" HeaderText="Username" SortExpression="UN" />
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
        <asp:SqlDataSource ID="sql_Guardian" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT GuardianID, LName + ',  ' + FName + '  ' + MName AS GuardianName, UN FROM Guardians">
        </asp:SqlDataSource>
    </p>
    <p>
        <table style="width:100%;" id="tblGuardian" runat="server" visible="false">
            <tr>
                <td class="style2">
                    Guardian ID:</td>
                <td>
                    <asp:Label ID="lblGuardianID" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    First Name:</td>
                <td>
                    <asp:TextBox ID="txtFName" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Middle Name:</td>
                <td>
                    <asp:TextBox ID="txtMName" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Last Name:</td>
                <td>
                    <asp:TextBox ID="txtLName" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Gender:</td>
                <td>
                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Birthday:</td>
                <td>
                    <asp:TextBox ID="txtBDay" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Contact No:</td>
                <td>
                    <asp:TextBox ID="txtContact" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Address:</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Username:</td>
                <td>
                    <asp:Label ID="lblUN" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblAlert" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                        Text="Update" />
&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                        Text="Cancel" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

