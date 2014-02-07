<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageAnnouncements.aspx.cs" Inherits="Admin_ManageAnnouncements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Announcements</h1>
    <asp:Button ID="btnAddAnnouncement" runat="server" Text="Add Announcement" 
        PostBackUrl="~/Admin/Announcement.aspx" />
    <br />
    <br />
    <asp:GridView ID="GrdAnnouncements" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AnnouncementID" 
        DataSourceID="SqlDS_Announcements" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <%--<asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                SortExpression="EmployeeID" />--%>
            <asp:BoundField DataField="AnnouncementID" HeaderText="Announcement No." 
                InsertVisible="False" ReadOnly="True" SortExpression="AnnouncementID" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" 
                SortExpression="Subject" />
            <asp:BoundField DataField="DateCreated" HeaderText="Date Posted" 
                SortExpression="DateCreated" />
                <asp:TemplateField HeaderText="Posted by">
                    <ItemTemplate>
                    <%# GetUsername(int.Parse(Eval("EmployeeID").ToString()))%>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:CommandField ButtonType="Button" SelectText="View/Edit" 
                ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDS_Announcements" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
        SelectCommand="SELECT * FROM [Announcement]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

