using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserManagement;
using CustomStrings;
using System.Data.SqlClient;
using DBHelpers;
using Globals;
using BCryptEncryption;

public partial class Admin_Default2 : System.Web.UI.Page
{

    string oldpass, newpass;
    int GuardianID;

    private string ConnString = StaticVariables.ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            GuardianID = Convert.ToInt32(Session["GuardianID"].ToString());
            string OldKey = Session["KEY"].ToString();
            lblUsername.Text = Guardians.ReturnUserName(GuardianID);
        }
        catch
        {

        }
    }

    bool CheckInputs()
    {
        oldpass = AntiXSSMethods.CleanString(txtOldPass.Text);
        if (oldpass == "")
        {
            return false;
        }

        if (AntiXSSMethods.CleanString(txtNewPass.Text) == AntiXSSMethods.CleanString(txtRetypeNewPass.Text))
        {
            //newpass = AntiXSSMethods.CleanString(txtNewPass.Text);
            newpass = Encryption.GenerateBCryptHash(txtNewPass.Text);
        }
        else
        {
            return false;
        }

        return true;

    }

    protected void btnChangePass_Click(object sender, EventArgs e)
    {
        if (CheckInputs())
        {
            try
            {
                string strUpdateQuery = "UPDATE Guardians SET PWD=@PWD WHERE GuardianID=@GID";
                SqlParameter[] UpdateParams = {
                                              //new SqlParameter("@PWD", Encryption.MD5(newpass)),
                                             new SqlParameter("@PWD", newpass),
                                             new SqlParameter("@GID", GuardianID)
                              };
                DataAccess.DataProcessExecuteNonQuery(strUpdateQuery, UpdateParams, ConnString);
                //Session.Add("KEY", Encryption.MD5(newpass));
                Session.Add("KEY", newpass);
                lblAlert.Text = "Change password succeeded!";
            }
            catch
            {
                lblAlert.Text = "Change password failed!";
            }
        }
        else
        {
            lblAlert.Text = "Please check your inputs.";
        }
    }
}