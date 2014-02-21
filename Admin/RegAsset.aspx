<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="RegAsset.aspx.cs" Inherits="Admin_RegAsset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 110px;
        }
        .style3
        {
            width: 110px;
            height: 26px;
        }
        .style4
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Register New Asset</h1>
    <p>
        <asp:Label ID="lblAlert" runat="server" style="color: #FF3300"></asp:Label>
    </p>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Select Tenant</td>
                <td>
                    <asp:DropDownList ID="ddlTenant" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="Name" 
                        DataValueField="TenantID" AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select Tenant -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        SelectCommand="SELECT TenantID, LName + ', ' + FName + '  ' + MName AS 'Name' FROM Tenants">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Asset Type</td>
                <td>
                    <asp:DropDownList ID="ddlType" runat="server">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem>Laptop</asp:ListItem>
                        <asp:ListItem>PC</asp:ListItem>
                        <asp:ListItem>TV</asp:ListItem>
                        <asp:ListItem>Electricfan</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Model Name</td>
                <td>
                    <asp:TextBox ID="txtModel" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Brand Name</td>
                <td>
                    <asp:TextBox ID="txtBrand" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Serial Number</td>
                <td class="style4">
                    <asp:TextBox ID="txtSerial" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="style4">
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    Amount</td>
                <td>
                    <asp:TextBox ID="txtAmount" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnReg" runat="server" Text="Register" onclick="btnReg_Click" />
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

