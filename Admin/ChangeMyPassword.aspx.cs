﻿using System;
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
using Auditor;

public partial class Admin_Default2 : System.Web.UI.Page
{

    string oldpass, newpass;
    int EmployeeID;
    private string ConnString = StaticVariables.ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            EmployeeID = Convert.ToInt32(Session["EmployeeID"].ToString());
            string OldKey = Session["KEY"].ToString();
            lblUsername.Text = Employees.ReturnUserName(EmployeeID);
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
                string strUpdateQuery = "UPDATE Employees SET PWD=@PWD WHERE EmployeeID=@EID";
                SqlParameter[] UpdateParams = {
                                              //new SqlParameter("@PWD", Encryption.MD5(newpass)),
                                             new SqlParameter("@PWD", newpass),
                                             new SqlParameter("@EID", EmployeeID)
                              };
                DataAccess.DataProcessExecuteNonQuery(strUpdateQuery, UpdateParams, ConnString);
                AuditTrailFunctions.UpdateEmployeeAuditTrail("Password change", EmployeeID);
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