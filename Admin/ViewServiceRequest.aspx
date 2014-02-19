<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewServiceRequest.aspx.cs" Inherits="Admin_ViewServiceRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 112px;
        }
        .style3
        {
            width: 173px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Service Request</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Tenant Name</td>
                <td class="style3">
                    <asp:Label ID="lblTenant" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Employee Assigned</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlEmp" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="Name" 
                        DataValueField="EmployeeID" AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select Employee -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        SelectCommand="SELECT EmployeeID, LName + ', ' + FName + '  ' + MName AS 'Name' FROM Employees">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Title</td>
                <td class="style3">
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Details</td>
                <td class="style3">
                    <asp:Label ID="lblDetails" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Remarks</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlRemarks" runat="server">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>On Going</asp:ListItem>
                        <asp:ListItem>Completed</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Priority</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlPriority" runat="server">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem>Low</asp:ListItem>
                        <asp:ListItem>Average</asp:ListItem>
                        <asp:ListItem>High</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Date Requested</td>
                <td class="style3">
                    <asp:Label ID="lblDateRequested" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Date Completed</td>
                <td class="style3">
                    <asp:TextBox ID="txtDateCompleted" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="lblAlert" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="style3">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                        onclick="btnUpdate_Click" />
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

