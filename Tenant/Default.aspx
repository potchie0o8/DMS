<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/TenantMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Tenant_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Tenant's Home Page</h1>
    <p>Announcements:</p>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="AnnouncementID" 
            DataSourceID="SqlDS_Announcements">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Label ID="AnnouncementIDLabel" runat="server" 
                            Text='<%# Eval("AnnouncementID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateCreatedLabel" runat="server" 
                            Text='<%# Eval("DateCreated") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmployeeIDLabel" runat="server" 
                            Text='<%# Eval("EmployeeID") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="AnnouncementIDLabel1" runat="server" 
                            Text='<%# Eval("AnnouncementID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DateCreatedTextBox" runat="server" 
                            Text='<%# Bind("DateCreated") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmployeeIDTextBox" runat="server" 
                            Text='<%# Bind("EmployeeID") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Clear" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DateCreatedTextBox" runat="server" 
                            Text='<%# Bind("DateCreated") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmployeeIDTextBox" runat="server" 
                            Text='<%# Bind("EmployeeID") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Label ID="AnnouncementIDLabel" runat="server" 
                            Text='<%# Eval("AnnouncementID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateCreatedLabel" runat="server" 
                            Text='<%# Eval("DateCreated") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmployeeIDLabel" runat="server" 
                            Text='<%# Eval("EmployeeID") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server">
                                        AnnouncementID</th>
                                    <th runat="server">
                                        Subject</th>
                                    <th runat="server">
                                        DateCreated</th>
                                    <th runat="server">
                                        EmployeeID</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td>
                        <asp:Label ID="AnnouncementIDLabel" runat="server" 
                            Text='<%# Eval("AnnouncementID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DateCreatedLabel" runat="server" 
                            Text='<%# Eval("DateCreated") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmployeeIDLabel" runat="server" 
                            Text='<%# Eval("EmployeeID") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDS_Announcements" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT [AnnouncementID], [Subject], [DateCreated], [EmployeeID] FROM [Announcement]">
        </asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

