<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ExpenseMgt.aspx.cs" Inherits="Admin_ExpenseMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 112px;
        }
        .style3
        {
            width: 112px;
            height: 30px;
        }
        .style4
        {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Expense Management</h1>
    <p>
        <asp:Button ID="btnAdd" runat="server" Text="Add new Expense" PostBackUrl="~/Admin/AddExpense.aspx" />
    </p>
    <p>
        <asp:GridView ID="grdExpense" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="sql_Expense" ForeColor="#333333" 
            GridLines="None" DataKeyNames="ExpenseID" 
            onselectedindexchanged="grdExpense_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Date" DataFormatString="{0: MMMM dd,yyyy}" 
                    HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="ExpenseType" HeaderText="Expense Type" 
                    SortExpression="ExpenseType" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" DataFormatString="{0:n}" />
                <asp:BoundField DataField="EmpName" HeaderText="Employee" ReadOnly="True" 
                    SortExpression="EmpName" />
                <asp:CommandField ButtonType="Button" SelectText="View" 
                    ShowSelectButton="True" />
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
        <asp:SqlDataSource ID="sql_Expense" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT Expenses.ExpenseID, Expenses.Date, Expenses.ExpenseType, Expenses.Amount, Employees.LName + ', ' + Employees.FName + '  ' + Employees.MName AS 'EmpName' FROM Expenses INNER JOIN Employees ON Expenses.EmployeeID = Employees.EmployeeID">
        </asp:SqlDataSource>
    </p>
    <p>
        <table id="tblExpense" style="width:100%;" runat="server" visible="false">
            <tr>
                <td class="style2">
                    Expense No:</td>
                <td>
                    <asp:Label ID="lblExpenseNo" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Date:</td>
                <td>
                    <asp:Label ID="lblDate" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Expense Type:</td>
                <td>
                    <asp:Label ID="lblExpenseType" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Remarks:</td>
                <td>
        <table id="tblExpense0" style="width:100%;" runat="server" visible="false">
            <tr>
                <td>
                    <asp:Label ID="lblRemarks" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Amount:</td>
                <td>
                    <asp:Label ID="lblAmount" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Employee Name:</td>
                <td>
                    <asp:Label ID="lblEmp" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    </td>
                <td class="style4">
                    <asp:Button ID="btnClose" runat="server" Text="Close" 
                        onclick="btnClose_Click" />
&nbsp;&nbsp; </td>
                <td class="style4">
                    </td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

