<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/TenantMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Tenant_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
<<<<<<< HEAD
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
=======
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 94px;
            font-weight: 700;
        }
        .style4
        {
            width: 94px;
            font-weight: 700;
            height: 23px;
        }
        .style5
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Tenant's Home Page</h1>
<div id="AnnContainer" align="center">

<h3>Announcements:</h3>
    <table class="style2" border="1">
        <tr>
            <td class="style3">
                Subject:</td>
            <td>
                <asp:Label ID="lblSubject" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Posted By:</td>
            <td>
                <asp:Label ID="lblPostedBy" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Date Posted:</td>
            <td class="style5">
                <asp:Label ID="lblDatePosted" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Message:</td>
            <td>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        </table>
        <br />
    <strong>Archive:</strong><asp:GridView ID="GRD_Announcements" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="AnnouncementID,Subject,DateCreated,EmployeeID,Message" 
            DataSourceID="SqlDS_Announcements" 
        onselectedindexchanged="GRD_Announcements_SelectedIndexChanged" 
        EmptyDataText="-No Announcements.-" BackColor="White" 
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        PageSize="5">
            <Columns>
               <%-- <asp:BoundField DataField="AnnouncementID" HeaderText="AnnouncementID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="AnnouncementID" />--%>
                <asp:BoundField DataField="Subject" HeaderText="Subject" 
                    SortExpression="Subject" />
                <asp:BoundField DataField="DateCreated" HeaderText="Date Posted" 
                    SortExpression="DateCreated" />
                <%--<asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                    SortExpression="EmployeeID" />--%>
                <asp:TemplateField HeaderText="Posted by" SortExpression="EmployeeID">
                <ItemTemplate>
                <%# RetrieveEmployeeUserName(int.Parse(Eval("EmployeeID").ToString())) %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField SelectText="View" ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
    <p>&nbsp;</p>
<p>
    <asp:SqlDataSource ID="SqlDS_Announcements" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
        SelectCommand="SELECT [AnnouncementID], [Subject], [Message], [DateCreated], [EmployeeID] FROM [Announcement] ORDER BY DateCreated DESC">
    </asp:SqlDataSource>
</p>

</div>
<hr />

>>>>>>> e8060fa0922a338a5a04d191cf2815e3db08c899
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

