<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="Complaints.aspx.cs" Inherits="Admin_Complaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 88px;
        }
        .style3
        {
            width: 313px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>View Complaint</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Complainant:</td>
                <td class="style3">
                    <asp:Label ID="lblTenant" runat="server"></asp:Label>
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
                    Subject:</td>
                <td class="style3">
                    <asp:Label ID="lblSubject" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Details:</td>
                <td class="style3">
                    <asp:Label ID="lblDetail" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Status:</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem Value="1">Pending</asp:ListItem>
                        <asp:ListItem Value="2">Resolved</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ddlStatus" ErrorMessage="Please select a status!" 
                        ForeColor="Red" ValidationGroup="Complaints"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Label ID="lblAlert" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                        onclick="btnUpdate_Click" ValidationGroup="Complaints" />
&nbsp;&nbsp;
                    <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/Admin/ComplaintMgt.aspx" />
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

