using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserManagement;
using Globals;
using DBHelpers;
using System.Data.SqlClient;

public partial class Tenant_Default : System.Web.UI.Page
{

    string ConnString = StaticVariables.ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string strSelectTop1 = "SELECT TOP 1 * FROM Announcement ORDER BY DateCreated DESC";
                SqlDataReader dr = DataAccess.ReturnReader(strSelectTop1, ConnString);
                dr.Read();
                lblDatePosted.Text = dr["DateCreated"].ToString();
                lblMessage.Text = Server.HtmlDecode(dr["Message"].ToString());
                lblSubject.Text = dr["Subject"].ToString();
                lblPostedBy.Text = Employees.ReturnUserName(int.Parse(dr["EmployeeID"].ToString()));
                dr.Close();
                DataAccess.ForceConnectionToClose();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    public string RetrieveEmployeeUserName(int _EID)
    {
        return Employees.ReturnUserName(_EID);
    }
    protected void GRD_Announcements_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblDatePosted.Text = GRD_Announcements.SelectedDataKey["DateCreated"].ToString();
        lblMessage.Text = Server.HtmlDecode(GRD_Announcements.SelectedDataKey["Message"].ToString());
        lblSubject.Text = GRD_Announcements.SelectedDataKey["Subject"].ToString();
        lblPostedBy.Text = Employees.ReturnUserName(int.Parse(GRD_Announcements.SelectedDataKey["EmployeeID"].ToString()));
    }
}