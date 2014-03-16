using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;
using Globals;
using Auditor;

public partial class Admin_GuardianReg : System.Web.UI.Page
{
    string conString = StaticVariables.ConnectionString;
    int EmployeeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID = int.Parse(Session["EmployeeID"].ToString());
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        bool UsernameExists = UserManagement.General.CheckIfExisting(textUname.Text);
        if (UsernameExists != true)
        {
            string strInsert = "INSERT INTO Guardians (FName, MName, LName, Gender, BDate, ContactNo, Email, Address, UN, Pwd) VALUES (@fname, @mname, @lname, @gender, @bdate, @contact, @email, @address, @un, @pwd)";
            SqlParameter[] insertParam = {
                                             new SqlParameter("@fname", AntiXSSMethods.CleanString(textFname.Text)),
                                             new SqlParameter("@mname", AntiXSSMethods.CleanString(textMname.Text)),
                                             new SqlParameter("@lname", AntiXSSMethods.CleanString(textLname.Text)),
                                             new SqlParameter("@gender", AntiXSSMethods.CleanString(ddlGender.SelectedValue)),
                                             new SqlParameter("@bdate", Convert.ToDateTime(textBirthday.Text)),
                                             new SqlParameter("@contact", AntiXSSMethods.CleanString(textContactNo.Text)),
                                             new SqlParameter("@email", AntiXSSMethods.CleanString(textEmail.Text)),
                                             new SqlParameter("@address", AntiXSSMethods.CleanString(textSaddress.Text)),
                                             new SqlParameter("@un", AntiXSSMethods.CleanString(textUname.Text)),
                                             new SqlParameter("@pwd", Encryption.GenerateBCryptHash(textPassword.Text))
                                         };
            DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
            AuditTrailFunctions.UpdateEmployeeAuditTrail("Added new Guardian", EmployeeID);
            Response.Redirect("TGLink.aspx");
        }
    }
}