<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/Guardian.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Admin_MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 63%;
            height: 245px;
        }
        .style3
        {
            width: 103px;
            font-weight: bold;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>My Profile</h1>
    <br />
    <table class="style2">
        <tr>
            <td class="style3">
                Guardian ID:</td>
            <td>
                <asp:Label ID="lblGuardianID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                First Name:</td>
            <td>
                <asp:Label ID="lblFName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Middle Name:</td>
            <td>
                <asp:Label ID="lblMName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Last Name:</td>
            <td>
                <asp:Label ID="lblLName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Date of Birth</td>
            <td>
                <asp:Label ID="lblDateOfBirth" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Gender:</td>
            <td>
                <asp:Label ID="lblGender" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Contact No.</td>
            <td>
                <asp:Label ID="lblContactNo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Email Address:</td>
            <td>
                <asp:Label ID="lblEmailAdd" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Address:</td>
            <td>
                <asp:Label ID="lblAddress" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Username:</td>
            <td>
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
            </td>
        </tr>
        </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

