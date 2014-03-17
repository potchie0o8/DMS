<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="Receipt.aspx.cs" Inherits="Admin_Accounts_Receipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h2>
        Payment Acknowledgement Page</h2>
    <p>
        <asp:FormView ID="FormView1" runat="server" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            DataKeyNames="Receipt No" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <EditItemTemplate>
                Receipt No.:
                <asp:Label ID="Receipt_No_Label1" runat="server" 
                    Text='<%# Eval("[Receipt No]") %>' />
                <br />
                Date Recieved:
                <asp:TextBox ID="Date_RecievedTextBox" runat="server" 
                    Text='<%# Bind("[Date Recieved]") %>' />
                <br />
                Remarks:
                <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                <br />
                Amount:
                <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                <br />
                Tenant No:
                <asp:TextBox ID="Tenant_NoTextBox" runat="server" 
                    Text='<%# Bind("[Tenant No]") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                Date Recieved:
                <asp:TextBox ID="Date_RecievedTextBox" runat="server" 
                    Text='<%# Bind("[Date Recieved]") %>' />
                <br />
                Remarks:
                <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                <br />
                Amount:
                <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                <br />
                Tenant No:
                <asp:TextBox ID="Tenant_NoTextBox" runat="server" 
                    Text='<%# Bind("[Tenant No]") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Receipt No.:
                <asp:Label ID="Receipt_No_Label" runat="server" 
                    Text='<%# Eval("[Receipt No]") %>' />
                <br />
                Date Recieved:
                <asp:Label ID="Date_RecievedLabel" runat="server" 
                    Text='<%# Bind("[Date Recieved]") %>' />
                <br />
                Remarks:
                <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
                <br />
                Amount:
                <asp:Label ID="AmountLabel" runat="server" Text='<%# Bind("Amount") %>' />
                <br />
                Tenant No:
                <asp:Label ID="Tenant_NoLabel" runat="server" 
                    Text='<%# Bind("[Tenant No]") %>' />
                <br />

            </ItemTemplate>
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT Receipts.ReceiptID AS [Receipt No], Receipts.Date AS [Date Recieved], Receipts.Remarks, Receipts.Amount, Bills.TenantID AS [Tenant No] FROM Receipts INNER JOIN Bills ON Receipts.ReceiptID = Bills.ReceiptID WHERE (Receipts.ReceiptID = @RID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="RID" QueryStringField="ID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

