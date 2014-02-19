using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Tenant_Violations : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int TenantID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            TenantID = int.Parse(Session["TenantID"].ToString());
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("ViewViolation.aspx?ID=" + GridView1.SelectedDataKey["ViolationID"].ToString());
    }
}