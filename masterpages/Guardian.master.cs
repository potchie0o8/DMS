using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using UserManagement;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDate.Text = "Date: "+ DateTime.Now.Month.ToString() + "/" + DateTime.Now.Day.ToString() + "/" + DateTime.Now.Year.ToString();
        CheckUser();
    }


    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Default.aspx");
    }


    private void CheckUser()
    {
        try
        {
            string Username = Tenants.ReturnUserName(int.Parse(Session["GuardianID"].ToString()));
            lblUsername.Text = Username;
        }
        catch
        {
            Session.Clear();
            Response.Redirect("~/Default.aspx");
        }
    }

}