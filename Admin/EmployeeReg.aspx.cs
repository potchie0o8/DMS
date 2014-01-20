using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;

public partial class Admin_EmployeeReg : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlParameter[] checkUNParam = {
                                          new SqlParameter("@un", txtUN.Text)
                                      };

        bool isExisting = DataAccess.DetermineIfExisting("SELECT * FROM Employees WHERE UN=@un", checkUNParam, conString);
        if (isExisting != true)
        {
            string strInsert = "INSERT INTO Employees (FName, MName, LName, Gender, BDate, ContactNo, Email, AdminLevel, UN, PWD, DateOfEmployment) VALUES (@fname, @mname, @lname, @gender, @bdate, @contact, @email, @adminlevel, @un, @pwd, @doe)";
            SqlParameter[] insrtParam = {
                                            new SqlParameter("@fname",  AntiXSSMethods.CleanString(txtFName.Text)),
                                            new SqlParameter("@mname", AntiXSSMethods.CleanString(txtMName.Text)),
                                            new SqlParameter("@lname", AntiXSSMethods.CleanString(txtLName.Text)),
                                            new SqlParameter("@gender", ddlGender.SelectedValue),
                                            new SqlParameter("@bdate", Convert.ToDateTime(txtBDay.Text)),
                                            new SqlParameter("@contact", AntiXSSMethods.CleanString((txtContact.Text))),
                                            new SqlParameter("@email", AntiXSSMethods.CleanString(txtEmail.Text)),
                                            new SqlParameter("@adminlevel", ddlAdminLevel.SelectedValue),
                                            new SqlParameter("@un", AntiXSSMethods.CleanString(txtUN.Text)),
                                            new SqlParameter("@pwd", Encryption.MD5(AntiXSSMethods.CleanString((txtPwd2.Text)))),
                                            new SqlParameter("@doe", Convert.ToDateTime(txtDateEmployeed.Text))
                                        };
            DataAccess.DataProcessExecuteNonQuery(strInsert, insrtParam, conString);
            Response.Write("<script>alert('Success!');</script>");
        }
        else
        {
            Response.Write("<script>alert('Username already taken!');</script>");
        }

        if (IsPostBack)
        {
            txtFName.Text = "";
            txtMName.Text = "";
            txtLName.Text = "";
            ddlGender.SelectedValue = "";
            txtBDay.Text = "";
            txtContact.Text = "";
            txtEmail.Text = "";
            ddlAdminLevel.SelectedValue = "";
            txtUN.Text = "";
            txtPwd1.Text = "";
            txtPwd2.Text = "";
            txtDateEmployeed.Text = "";
        }
    }
}