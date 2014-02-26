using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Tenant_Messages : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int TenantID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            TenantID = int.Parse(Session["TenantID"].ToString());

            SqlDS_Messages.SelectCommand = "SELECT Messages.MessageID, Messages.EmployeeID, Messages.Subject, Messages.Date, Employees.LName + ', ' + Employees.FName + '  ' + Employees.MName AS 'EmpName' FROM Messages INNER JOIN Employees ON Messages.EmployeeID = Employees.EmployeeID WHERE Messages.TenantID=@TID";
            SqlDS_Messages.SelectParameters.Add(new Parameter("TID", System.Data.DbType.Int32, TenantID.ToString()));
            
            SqlDS_Messages.DataBind();


        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void GrdMessages_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("ViewMessage.aspx?ID=" + GridView2.SelectedDataKey["MessageID"].ToString());
    }
}