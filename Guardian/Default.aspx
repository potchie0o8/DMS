<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/Guardian.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Guardian_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 115px;
        }
        .style3
        {
            width: 115px;
            height: 23px;
        }
        .style4
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <center><h1>WELCOME to Guardians Portal!</h1>
    <h3>Here you can view Tenant's Profile, DTR and Violations under your guardianship.</h3></center>
        <p>
            <asp:GridView ID="grdTGLink" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="sql_TGLink" ForeColor="#333333" 
                GridLines="None" DataKeyNames="TenantID" 
                onselectedindexchanged="grdTGLink_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="TenantID" HeaderText="Tenant ID" />
                    <asp:BoundField DataField="TenantName" HeaderText="Tenant Name" ReadOnly="True" 
                        SortExpression="TenantName" />
                    <asp:BoundField DataField="Relation" HeaderText="Relation" 
                        SortExpression="Relation" />
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
            <asp:SqlDataSource ID="sql_TGLink" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                SelectCommand="SELECT Tenants.TenantID, Tenants.LName + ',  ' + Tenants.FName + '  ' + Tenants.MName AS 'TenantName', TGLink.Relation FROM TGLink INNER JOIN Tenants ON TGLink.TenantID = Tenants.TenantID WHERE (TGLink.GuardianID = @GID)">
                <SelectParameters>
                    <asp:SessionParameter Name="GID" SessionField="GuardianID" />
                </SelectParameters>
            </asp:SqlDataSource>
    </p>
    <p>
            <table style="width:100%;" id="tblTenant" runat="server" visible="false">
                <tr>
                    <td class="style2">
                <asp:Image ID="ImgPhoto" runat="server" Width="200px" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Tenant ID:</td>
                    <td class="style4">
                        <asp:Label ID="lblTenantID" runat="server"></asp:Label>
                    </td>
                    <td class="style4">
                        </td>
                </tr>
                <tr>
                    <td class="style2">
                        First Name</td>
                    <td>
                        <asp:Label ID="lblFName" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Middle Name:</td>
                    <td>
                        <asp:Label ID="lblMName" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Last Name:</td>
                    <td>
                        <asp:Label ID="lblLName" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Gender:</td>
                    <td class="style4">
                        <asp:Label ID="lblGender" runat="server"></asp:Label>
                    </td>
                    <td class="style4">
                        </td>
                </tr>
                <tr>
                    <td class="style3">
                        Email:</td>
                    <td class="style4">
                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </td>
                    <td class="style4">
                        </td>
                </tr>
                <tr>
                    <td class="style2">
                        Birthday:</td>
                    <td>
                        <asp:Label ID="lblBday" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Street:</td>
                    <td>
                        <asp:Label ID="lblStreet" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        City:</td>
                    <td>
                        <asp:Label ID="lblCity" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Region:</td>
                    <td>
                        <asp:Label ID="lblRegion" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Country:</td>
                    <td>
                        <asp:Label ID="lblCountry" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Mobile No.:</td>
                    <td>
                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
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
                        Date Registered:</td>
                    <td>
                        <asp:Label ID="lblDateRegistered" runat="server"></asp:Label>
                    </td>
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

