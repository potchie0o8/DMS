using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;

public partial class Admin_TenantReg : System.Web.UI.Page
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

        bool isExisting = DataAccess.DetermineIfExisting("SELECT * FROM Tenants WHERE UN=@un", checkUNParam, conString);
        if (isExisting != true)
        {
            string strInsert = "INSERT INTO Tenants WHERE (FName, MName, LName, Gender, Email, BDate, Street, City, Region, Country, MobileNo, UN, Pwd) VALUES (@fname, @mname, @lname, @gender, @email, @bdate, @street, @city, @region, @country, @mobileNo, @un, @pwd)";
            SqlParameter[] insertParam = {
                                             new SqlParameter("@fname", txtFName.Text),
                                             new SqlParameter("@mname", txtMName.Text),
                                             new SqlParameter("@lname", txtLName.Text),
                                             new SqlParameter("@gender", ddlGender.SelectedValue),
                                             new SqlParameter("@email", txtEmail.Text),
                                             new SqlParameter("@bdate", txtBDay.Text),
                                             new SqlParameter("@street", txtStreet.Text),
                                             new SqlParameter("@city", txtCity.Text),
                                             new SqlParameter("@region", txtRegion.Text),
                                             new SqlParameter("@country", txtCountry.Text),
                                             new SqlParameter("@mobileNo", txtContact.Text),
                                             new SqlParameter("@un", txtUN.Text),
                                             new SqlParameter("@pwd", Encryption.MD5(txtPwd2.Text))
                                         };
            DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
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
            txtEmail.Text = "";
            txtBDay.Text = "";
            txtStreet.Text = "";
            txtCity.Text = "";
            txtRegion.Text = "";
            txtCountry.Text = "";
            txtContact.Text = "";
            txtUN.Text = "";
            txtPwd1.Text = "";
            txtPwd2.Text = "";
        }
    }
}