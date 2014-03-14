<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="VerifyUser.aspx.cs" Inherits="Admin_VerifyUser" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 47%;
            height: 363px;
        }
        .style3
        {
        }
        .style4
        {
            width: 100%;
        }
        .style5
        {
            width: 143px;
        }
        .style6
        {
            text-align: left;
        }
        .style7
        {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Verify User</h1>
<p>Use this utility when the fingerprint scanner fails to recognize a fingerprint.</p>
    <p>&nbsp;</p>
    <p>Search User:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp; Category:&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>-Select-</asp:ListItem>
            <asp:ListItem>Username</asp:ListItem>
            <asp:ListItem>First Name</asp:ListItem>
            <asp:ListItem>Last Name</asp:ListItem>
            <asp:ListItem>User ID No.</asp:ListItem>
        </asp:DropDownList>
&nbsp; User Type:
        <asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem>-Select-</asp:ListItem>
            <asp:ListItem Value="Tenants">Tenant</asp:ListItem>
            <asp:ListItem Value="Employees">Employee</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" />
    </p>
    <p><strong>Results:</strong></p>
    <p>
        <asp:GridView ID="GRD_Results" runat="server" EmptyDataText="- No Results -" 
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField SelectText="View" ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </p>
    <table class="style2" border="1">
        <tr>
            <td class="style3" colspan="2">
                <strong>PLEASE CHECK IF INFO MATCHES BELOW:</strong></td>
        </tr>
        <tr>
            <td class="style3">
                Photo:</td>
            <td class="style7">
                <asp:Image ID="IMGPHOTO" runat="server" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                Username:</td>
            <td class="style7">
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                ID Number:</td>
            <td class="style7">
                <asp:Label ID="lblIDNo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                User Type:</td>
            <td class="style7">
                <asp:Label ID="lblUserType" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                First Name:</td>
            <td class="style7">
                <asp:Label ID="lblFName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Last Name:</td>
            <td class="style7">
                <asp:Label ID="lblLName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Has Valid Contract? (Tenants only): </td>
            <td class="style7">
                <asp:Label ID="lblHasContract" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Curfew (Tenants only):</td>
            <td class="style7">
                <asp:Label ID="lblCurfew" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    Manual DTR manipulation
    <br />
    (<em>If the entering/leaving user matches info. Currently logged in staff shall 
    be held responsible for wrong DTR recording.)<br />
    </em>
    <table class="style4">
        <tr>
            <td class="style5">
    Time in or out:&nbsp;
            </td>
            <td class="style6">
    IN<asp:RadioButton ID="rbIN" runat="server" GroupName="DTR" Checked="True"/>
    OUT<asp:RadioButton ID="rbOut" runat="server" GroupName="DTR"/>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Remarks:</td>
            <td>
                <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSubmit" runat="server" 
        Text="Confirm Verification and Record DTR" />
    <asp:ConfirmButtonExtender ID="Button1_ConfirmButtonExtender" runat="server" 
        ConfirmText="Are you sure the user logging in/out is the registered user?" 
        TargetControlID="btnSubmit">
    </asp:ConfirmButtonExtender>
    <br />
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

