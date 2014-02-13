<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/TenantMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Tenant_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
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

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

