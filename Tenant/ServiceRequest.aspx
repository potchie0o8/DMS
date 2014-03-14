<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/TenantMaster.master" AutoEventWireup="true" CodeFile="ServiceRequest.aspx.cs" Inherits="Tenant_ServiceRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
        width: 52px;
    }
    .style3
    {
        width: 586px;
    }
    .style4
    {
        color: #000000;
    }
    .style5
    {
        width: 52px;
        color: #000000;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Submit Service Request</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style5">
                    Title:</td>
                <td class="style3">
                    <asp:TextBox ID="txtTitle" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtTitle" CssClass="style4" 
                        ErrorMessage="Please enter service title!" ForeColor="Red" 
                        ValidationGroup="ServiceRequest"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Details"></asp:Label>
                    :</td>
                <td class="style3">
                    <asp:TextBox ID="txtDetails" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtDetails" ErrorMessage="Please enter details!" 
                        ForeColor="Red" ValidationGroup="ServiceRequest"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                        Text="Submit" ValidationGroup="ServiceRequest" />
                &nbsp;&nbsp;&nbsp;
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

