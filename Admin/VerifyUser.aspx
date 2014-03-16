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
        <asp:TextBox ID="txtSearchQuery" runat="server"></asp:TextBox>
&nbsp; Category:&nbsp;&nbsp;
        <asp:DropDownList ID="ddlCategory" runat="server">
            <asp:ListItem Value="">-Select-</asp:ListItem>
            <asp:ListItem Value="UN">Username</asp:ListItem>
            <asp:ListItem Value="ID">User ID No.</asp:ListItem>
        </asp:DropDownList>
&nbsp; User Type:
        <asp:DropDownList ID="ddlUserType" runat="server">
            <asp:ListItem Value="">-Select-</asp:ListItem>
            <asp:ListItem Value="Tenants">Tenant</asp:ListItem>
            <asp:ListItem Value="Employees">Employee</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    </p>
    <p><strong>Results: </strong><asp:Label ID="lblAlert" ForeColor="Red" runat="server" Text=""></asp:Label></p>
    <p>

      
        <asp:GridView ID="GRD_Results" runat="server" EmptyDataText="- No Results -" 
            CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="ID" 
            onselectedindexchanged="GRD_Results_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" SelectText="View" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="User ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="UN" HeaderText="Username" SortExpression="UN" />
                <asp:BoundField DataField="FName" HeaderText="First Name" 
                    SortExpression="FName" />
                <asp:BoundField DataField="MName" HeaderText="Middle Name" 
                    SortExpression="MName" />
                <asp:BoundField DataField="LName" HeaderText="Last Name" 
                    SortExpression="LName" />
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
    <table class="style2" id="tblView" runat="server" border="1" visible="false">
        <tr>
            <td class="style3" colspan="2">
                <strong>PLEASE CHECK IF INFO MATCHES BELOW:</strong></td>
        </tr>
        <tr>
            <td class="style3">
                Photo:</td>
            <td class="style7">
                <asp:Image ID="IMGPHOTO" runat="server" Width="300px" />
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
                Middle Name:</td>
            <td class="style7">
                <asp:Label ID="lblMName" runat="server"></asp:Label>
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
    <em><br />
    </em>
    <table class="style4" id="tblInOut" runat="server" border="1" visible="false">
        <tr>
            <td class="style5" colspan="2">
                <strong>Manual DTR manipulation
    </strong>
    <br />
    (<em>If the entering/leaving user matches info. Currently logged in staff shall 
    be held responsible for wrong DTR recording.)</em></td>
        </tr>
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
    <asp:Button ID="btnSubmit" Enabled="false" runat="server" 
        Text="Confirm Verification and Record DTR" onclick="btnSubmit_Click" />
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

