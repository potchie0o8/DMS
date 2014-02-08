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
<p>Announcements:</p>
    <table class="style2">
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
                Date Posted</td>
            <td class="style5">
                <asp:Label ID="lblDatePosted" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Message:</td>
            <td rowspan="3">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
        </tr>
    </table>
        <asp:GridView ID="GRD_Announcements" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="AnnouncementID" 
            DataSourceID="SqlDS_Announcements" 
        onselectedindexchanged="GRD_Announcements_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="AnnouncementID" HeaderText="AnnouncementID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="AnnouncementID" />
                <asp:BoundField DataField="Subject" HeaderText="Subject" 
                    SortExpression="Subject" />
                <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" 
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
        </asp:GridView>
    <p>&nbsp;</p>
<p>
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

