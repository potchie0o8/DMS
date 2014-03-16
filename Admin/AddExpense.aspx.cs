using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Globals;
using System.Data.SqlClient;
using CustomStrings;
using DBHelpers;

public partial class Admin_AddExpense : System.Web.UI.Page
{
    string connString = StaticVariables.ConnectionString;
    int EmployeeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID = int.Parse(Session["EmployeeID"].ToString());
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO Expenses(ExpenseType, Amount, Remarks, EmployeeID) VALUES (@type, @amount, @remarks, @EID)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@type", AntiXSSMethods.CleanString(ddlExpenseType.SelectedValue)),
                                         new SqlParameter("@amount", AntiXSSMethods.CleanString(txtAmount.Text)),
                                         new SqlParameter("@remarks", AntiXSSMethods.CleanString(txtRemarks.Text)),
                                         new SqlParameter("@EID", EmployeeID)
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, connString);
        Response.Redirect("ExpenseMgt.aspx");
    }
}