<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="AddExpense.aspx.cs" Inherits="Admin_AddExpense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 96px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Add Expenses</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Expense Type:</td>
                <td>
                    <asp:DropDownList ID="ddlExpenseType" runat="server">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem>Electricity</asp:ListItem>
                        <asp:ListItem>Water</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtAmount" ErrorMessage="Please select expense type!" 
                        ForeColor="Red" ValidationGroup="Expense"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Remarks:</td>
                <td>
                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Amount:</td>
                <td>
                    <asp:TextBox ID="txtAmount" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtAmount" ErrorMessage="Please indicate amount!" 
                        ForeColor="Red" ValidationGroup="Expense"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                        Text="Submit" ValidationGroup="Expense" />
&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
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

