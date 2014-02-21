using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBHelpers;
using System.Data.SqlClient;
using Globals;

public partial class Admin_MyProfile : System.Web.UI.Page
{
    string ConnString = StaticVariables.ConnectionString;

    int EmployeeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            EmployeeID = int.Parse(Session["EmployeeID"].ToString());
            LoadData(EmployeeID);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void LoadData(int _EmployeeID) 
    {
        lblEmployeeID.Text = _EmployeeID.ToString();
        string strSelect = "SELECT * FROM Employees WHERE EmployeeID=@EID";
        SqlParameter[] EID = { new SqlParameter("@EID", _EmployeeID) };
        SqlDataReader dr = DataAccess.ReturnReader(strSelect, EID, ConnString);
        dr.Read();
        lblAdminAccess.Text = IntToWords.getAdminAccess(int.Parse(dr["AdminLevel"].ToString()));
        lblContactNo.Text = dr["ContactNo"].ToString();
        lblDateOfBirth.Text = Convert.ToDateTime(dr["BDate"].ToString()).ToString("MMMM dd, yyyy");
        lblDateOfEmployment.Text = dr["DateOfEmployment"].ToString();
        lblEmailAdd.Text = dr["Email"].ToString();
        lblFingerID.Text = dr["FingerprintID"].ToString();
        lblFName.Text = dr["FName"].ToString();
        lblGender.Text = IntToWords.getGender(int.Parse(dr["Gender"].ToString()));
        lblLName.Text = dr["LName"].ToString();
        lblMName.Text = dr["MName"].ToString();
        lblUsername.Text = dr["UN"].ToString();
        string photofile = dr["PhotoFile"].ToString();

        if (photofile.Trim() == "" || photofile == null)
        {
            ImgMyPhoto.ImageUrl = "~/images/nophoto.jpg";
        }
        else
        {
            ImgMyPhoto.ImageUrl = "~/uploads/" + photofile;
        }



        DataAccess.ForceConnectionToClose();


    }

  //  SELECT TOP 1000 [EmployeeID]
  //    ,[FName]
  //    ,[MName]
  //    ,[LName]
  //    ,[Gender]
  //    ,[BDate]
  //    ,[ContactNo]
  //    ,[Email]
  //    ,[AdminLevel]
  //    ,[UN]
  //    ,[Pwd]
  //    ,[DateOfEmployment]
  //    ,[PhotoFile]
   //   ,[FingerprintID]
  //FROM [DMS_3].[dbo].[Employees]

}