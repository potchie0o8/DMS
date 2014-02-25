<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="GenerateBilling.aspx.cs" Inherits="Admin_GenerateBilling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Bills Generation Page</h1>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="TenantID" 
            DataSourceID="SqlDS_Tenants">          
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFBD6;color: #333333;">
                    <td>
                        <asp:Label ID="TenantIDLabel" runat="server" Text='<%# Eval("TenantID") %>' />
                    </td>
                    <td>
                        <%# Eval("LName").ToString() + ", " + Eval("FName").ToString() + " " + Eval("MName").ToString() %>
                    </td>
                    <td>
                        <%# GetGender(int.Parse(Eval("Gender").ToString())) %>
                    </td>
                    <td>
                        <%# Eval("UN") %>
                    </td>
                    <td>
                        <asp:Label ID="DateRegisteredLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("DateRegistered").ToString()).ToShortDateString() %>' />
                    </td>
                     <td>
                        <%# GetBalance(int.Parse(Eval("TenantID").ToString())) %>
                    </td>
                    <td>
                        <a href='<%# "GenerateBilling2.aspx?ID=" + Eval("TenantID").ToString() %>'>Manage Tenant Account</a>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                    <th runat="server">
                                        TenantID</th>
                                    <th runat="server">
                                        Tenant Name</th>
                                    <th runat="server">
                                        Gender</th>
                                    <th runat="server">
                                        Username</th>
                                    <th runat="server">
                                        Date Registered</th>
                                    <th id="Th1" runat="server">
                                        Pending Balance</th>
                                    <th id="Th2" runat="server"></th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDS_Tenants" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT * FROM [Tenants]"></asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

