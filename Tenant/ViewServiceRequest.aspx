<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/TenantMaster.master" AutoEventWireup="true" CodeFile="ViewServiceRequest.aspx.cs" Inherits="Tenant_ViewServiceRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 110px;
        }
        .style3
        {
            width: 155px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>View Service Request</h1>
    <p>
        <table style="width:100%;">
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
                <td class="style2">
                    Details:</td>
                <td class="style3">
                    <asp:Label ID="lblDetails" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Remarks:</td>
                <td class="style3">
                    <asp:Label ID="lblRemarks" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Priority:</td>
                <td class="style3">
                    <asp:Label ID="lblPriority" runat="server"></asp:Label>
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
                    <asp:Label ID="lblDateCompleted" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Tenant/ServiceRequestMgt.aspx" />
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

