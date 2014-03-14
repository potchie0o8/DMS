using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using CustomStrings;
using DBHelpers;

public partial class Admin_GuardianMgt : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    //int TenantID;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}