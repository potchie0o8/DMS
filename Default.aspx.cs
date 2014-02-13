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
using System.Data.SqlClient;
using UserManagement;
using CustomStrings;
using DBHelpers;
using Globals;

public partial class _Default : System.Web.UI.Page
{

    string ConnString = StaticVariables.ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        
        // Checks if the credentials fit each table... there can only be one.
        int EmployeeID = Employees.CheckUser(txtUsername.Text, txtPassword.Text);
        int TenantID = Tenants.CheckUser(txtUsername.Text, txtPassword.Text);
        int GuardianID = Guardians.CheckUser(txtUsername.Text, txtPassword.Text);


        if (EmployeeID + GuardianID + TenantID == 0)
        {
            lblAlert.Text = "Check your credentials!";
            Response.Write((EmployeeID + GuardianID + TenantID).ToString());
        }

        if (EmployeeID != 0)
        {
            Session.Add("EmployeeID", EmployeeID);
            Session.Add("AccessLevel", Employees.GetAccessLevel(EmployeeID));
            //Session.Add("KEY", Encryption.MD5(AntiXSSMethods.CleanString(txtPassword.Text)));
            Session.Add("KEY", Encryption.GenerateBCryptHash(txtPassword.Text));
            Response.Redirect("~/Admin/Default.aspx");
        }

        else if (TenantID != 0)
        {
            Session.Add("TenantID", TenantID);
            //Session.Add("KEY", Encryption.MD5(AntiXSSMethods.CleanString(txtPassword.Text)));
            Session.Add("KEY", Encryption.GenerateBCryptHash(txtPassword.Text));
            Response.Redirect("~/Tenant/Default.aspx");
        }

        else if (GuardianID != 0)
        {
            Session.Add("GuardianID", GuardianID);
            //Session.Add("KEY", Encryption.MD5(AntiXSSMethods.CleanString(txtPassword.Text)));
            Session.Add("KEY", Encryption.GenerateBCryptHash(txtPassword.Text));
            Response.Redirect("~/Guardian/Default.aspx");
        }


    }
   

}