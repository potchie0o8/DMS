using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{

    string ConnString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        
    }
   

}