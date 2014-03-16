using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DBHelpers;
using Globals;

public partial class Admin_ExpenseMgt : System.Web.UI.Page
{
    string connString = StaticVariables.ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grdExpense_SelectedIndexChanged(object sender, EventArgs e)
    {
        int SelectedExpense = int.Parse(grdExpense.SelectedDataKey["ExpenseID"].ToString());
        loaddata(SelectedExpense);
    }
    public void loaddata(int _ExpenseID)
    {
        tblExpense.Visible = true;
        SqlParameter[] ExID = { new SqlParameter("@exID", _ExpenseID) };
        SqlDataReader dr = DataAccess.ReturnReader("SELECT Expenses.ExpenseID, Expenses.Date, Expenses.ExpenseType, Expenses.Amount, Expenses.Remarks, Employees.LName + ', ' + Employees.FName + '  ' + Employees.MName AS 'EmpName' FROM Expenses INNER JOIN Employees ON Expenses.EmployeeID = Employees.EmployeeID", ExID, connString);
        dr.Read();
        lblExpenseNo.Text = dr["ExpenseID"].ToString();
        lblDate.Text = Convert.ToDateTime(dr["Date"].ToString()).ToString("MMMM dd,yyyy");
        lblExpenseType.Text = dr["ExpenseType"].ToString();
        lblRemarks.Text = dr["Remarks"].ToString();
        lblAmount.Text = dr["Amount"].ToString();
        lblEmp.Text = dr["EmpName"].ToString();
        DataAccess.ForceConnectionToClose();
    }
}