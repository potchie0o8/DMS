<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewServiceRequest.aspx.cs" Inherits="Admin_ViewServiceRequest" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
        .style4
        {
            width: 112px;
            height: 24px;
        }
        .style5
        {
            width: 173px;
            height: 24px;
        }
        .style6
        {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Service Request</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Tenant Name:</td>
                <td class="style3">
                    <asp:Label ID="lblTenant" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Employee Assigned:</td>
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
                    Title:</td>
                <td class="style3">
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    Details:</td>
                <td class="style5">
                    <asp:Label ID="lblDetails" runat="server"></asp:Label>
                </td>
                <td class="style6">
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    Remarks:</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlRemarks" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlRemarks_SelectedIndexChanged">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem Value="Pending">Pending</asp:ListItem>
                        <asp:ListItem Value="On Going">On Going</asp:ListItem>
                        <asp:ListItem Value="Completed">Completed</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Priority:</td>
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
                    Date Requested:</td>
                <td class="style3">
                    <asp:Label ID="lblDateRequested" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Date Completed:</td>
                <td class="style3">
                    <asp:TextBox ID="txtDateCompleted" runat="server" Width="180px" visible="false"></asp:TextBox>
                    <asp:MaskedEditExtender ID="txtDateCompleted_MaskedEditExtender" runat="server" 
                        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                        Mask="99/99/9999" MaskType="Date" TargetControlID="txtDateCompleted">
                    </asp:MaskedEditExtender>
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
                &nbsp;
                    <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Admin/ServiceRequestMgt.aspx" />
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

