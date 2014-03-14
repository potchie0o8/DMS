<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/TenantMaster.master" AutoEventWireup="true" CodeFile="ViewMessage.aspx.cs" Inherits="Tenant_ViewMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 70px;
        }
        .style3
        {
            width: 229px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Message View</h1>
    <p>
        <table style="width:100%; margin-top: 19px;">
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
                    <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Tenant/Messages.aspx" />
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

