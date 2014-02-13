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

public partial class Admin_GuardianReg : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlParameter[] checkUNParam = {
                                          new SqlParameter("@un", textUname.Text)
                                      };

        bool isExisting = DataAccess.DetermineIfExisting("SELECT * FROM Guardians WHERE UN=@un", checkUNParam, conString);
        if (isExisting != true)
        {
            string strInsert = "INSERT INTO Guardians (FName, MNAme, LName, Gender, Birthday, ContactNo, Email, Street, City, Region, Country, UN, PWD) VALUES (@fname, @mname, @lname, @gender, @bday, @contact, @email, @streetaddress, @cityorprovince, @region, @country, @un, @pwd)";
            SqlParameter[] insrtParam = {
                                            new SqlParameter("@fname",  AntiXSSMethods.CleanString(textFname.Text)),
                                            new SqlParameter("@mname", AntiXSSMethods.CleanString(textMname.Text)),
                                            new SqlParameter("@lname", AntiXSSMethods.CleanString(textLname.Text)),
                                            new SqlParameter("@gender", ddlGender.SelectedValue),
                                            new SqlParameter("@bday", AntiXSSMethods.CleanString(textBirthday.Text)),
                                            new SqlParameter("@contact",  AntiXSSMethods.CleanString(textContactNo.Text)),
                                            new SqlParameter("@email",  AntiXSSMethods.CleanString(textEmail.Text)),
                                            new SqlParameter("@streetaddress", AntiXSSMethods.CleanString(textSaddress.Text)),
                                            new SqlParameter("@cityorprovince", AntiXSSMethods.CleanString(textCityProvince.Text)),
                                            new SqlParameter("@region", AntiXSSMethods.CleanString(textRegion.Text)),
                                            new SqlParameter("@country",  AntiXSSMethods.CleanString(textCountry.Text)),
                                            new SqlParameter("@un", AntiXSSMethods.CleanString(textUname.Text)),
                                            new SqlParameter("@pwd", Encryption.MD5(AntiXSSMethods.CleanString((textRPassword.Text))))
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
            textFname.Text = "";
            textMname.Text = "";
            textLname.Text = "";
            ddlGender.SelectedValue = "";
            textBirthday.Text = "";
            textContactNo.Text = "";
            textEmail.Text = "";
            textSaddress.Text = "";
            textCityProvince.Text = "";
            textRegion.Text = "";
            textCountry.Text = "";
            textPassword.Text = "";
            textRPassword.Text = "";
            
        }


    }
}