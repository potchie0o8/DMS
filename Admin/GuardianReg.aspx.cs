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

public partial class Admin_GuardianReg : System.Web.UI.Page
{
    string conString = StaticVariables.ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

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
                                             new SqlParameter("@pwd", AntiXSSMethods.CleanString(textPassword.Text))
                                         };
            DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
            Response.Redirect("TGLink.aspx");
        }
    }
}