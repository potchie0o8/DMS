<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageAsset.aspx.cs" Inherits="Admin_ManageAsset" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 75px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Manage Asset Page</h1>
    <p>
        <asp:Label ID="lblAlert" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Asset ID</td>
                <td>
                    <asp:Label ID="lblAssetID" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Owner:</td>
                <td>
                    <asp:Label ID="lblTenant" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Asset Type:</td>
                <td>
                    <asp:Label ID="lblType" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Model:</td>
                <td>
                    <asp:Label ID="lblModel" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Brand:</td>
                <td>
                    <asp:Label ID="lblBrand" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Serial No:</td>
                <td>
                    <asp:Label ID="lblSerial" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Amount:</td>
                <td>
                    <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update Amount" 
                        onclick="btnUpdate_Click" />
&nbsp;
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                        onclick="btnDelete_Click" />
                    <asp:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" 
                        ConfirmText="Are you sure you want to delete this announcement?" 
                        TargetControlID="btnDelete">
                    </asp:ConfirmButtonExtender>
                    &nbsp;&nbsp;
                    
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Admin/ManageAssets.aspx" />
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

