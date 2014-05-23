<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="MessageMgt.aspx.cs" Inherits="Admin_MessageMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 61px;
        }
        .style3
        {
            width: 337px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Messages</h1>
<p>
    <asp:Button ID="btnCreate" runat="server" Text="Create New Message" PostBackUrl="~/Admin/AddMessage.aspx" />
</p>
<p>
    <asp:GridView ID="grdMsg" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="MessageID" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="View" ShowSelectButton="True" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
            <asp:BoundField DataField="Date" DataFormatString="{0:MMMM dd,yyyy hh:mm tt}" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="EmpName" HeaderText="Sender" ReadOnly="True" SortExpression="EmpName" />
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                <%#  IsRead(Eval("IsRead").ToString()) %>
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
        SelectCommand="SELECT Messages.MessageID, Messages.EmployeeID, Messages.Subject, Messages.IsRead, Messages.Subject, Messages.Date, Employees.LName + ', ' + Employees.FName + '  ' + Employees.MName AS 'EmpName' FROM Messages INNER JOIN Employees ON Messages.EmployeeID = Employees.EmployeeID ORDER BY Messages.Date DESC">
    </asp:SqlDataSource>
</p>
    <p>
        <table style="width:100%;" id="tblMsg" runat="server" visible="false">
            <tr>
                <td class="style2">
                    Subject:</td>
                <td class="style3">
                    <asp:Label ID="lblSubject" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Date:</td>
                <td class="style3">
                    <asp:Label ID="lblDate" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Sender:</td>
                <td class="style3">
                    <asp:Label ID="lblSender" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Message:</td>
                <td class="style3">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="btnClose" runat="server" onclick="btnClose_Click" 
                        Text="Close" />
&nbsp;&nbsp; </td>
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

