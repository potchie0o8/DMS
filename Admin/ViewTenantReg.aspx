<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewTenantReg.aspx.cs" Inherits="Admin_ViewTenantReg" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">

        .style3
        {
            text-decoration: none;
            width: 124px;
        }
        .style4
        {
            width: 180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Tenant Registration</h1>
    <p>
        <table style="width:100%;">
            <tr>
            <td class="style3">
                First Name</td>
                <td class="style4">
                    <asp:Label ID="lblFName" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                Middle Name</td>
                <td class="style4">
                    <asp:Label ID="lblMName" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                Last Name</td>
                <td class="style4">
                    <asp:Label ID="lblLName" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                Gender</td>
                <td class="style4">
                    <asp:Label ID="lblGender" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                Birthday</td>
                <td class="style4">
                    <asp:Label ID="lblBDate" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                Contact No</td>
                <td class="style4">
                    <asp:Label ID="lblContact" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                Email</td>
                <td class="style4">
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                Street</td>
                <td class="style4">
                    <asp:Label ID="lblStreet" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                City/Province</td>
                <td class="style4">
                    <asp:Label ID="lblCity" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                Region</td>
                <td class="style4">
                    <asp:Label ID="lblRegion" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                Country</td>
                <td class="style4">
                    <asp:Label ID="lblCountry" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                Username</td>
                <td class="style4">
                    <asp:Label ID="lblUN" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td class="style3">
                &nbsp;</td>
                <td class="style4">
                    <asp:Button ID="btnGuardianReg" runat="server" 
                        Text="Proceed to Guardian Registration" />
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="btnBack" runat="server" Text="Back" />
                </td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

