using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;

public partial class Tenant_ViewViolation : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int ViolationID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ViolationID = int.Parse(Request.QueryString["ID"]);
            loaddata(ViolationID);
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void loaddata(int _VID)
    {
        SqlParameter[] VID = {
                                 new SqlParameter("@VID", _VID)
                             };
        SqlDataReader dr = DataAccess.ReturnReader("SELECT Violations.Title, Violations.Description, Violations.Fine, Violations.DateTime, Violations.EmployeeID, Employees.LName + ', ' + Employees.FName + '  ' + Employees.MName AS 'FullName' FROM Violations, Employees WHERE Violations.EmployeeID=Employees.EmployeeID", VID, conString);
        dr.Read();
        lblTitle.Text = dr["Title"].ToString();
        lblDetails.Text = dr["Description"].ToString();
        lblFine.Text = Convert.ToDouble(dr["Fine"].ToString()).ToString();
        lblDate.Text = Convert.ToDateTime(dr["DateTime"].ToString()).ToShortDateString();
        lblEmp.Text = dr["FullName"].ToString();
        DataAccess.ForceConnectionToClose();
    }
}