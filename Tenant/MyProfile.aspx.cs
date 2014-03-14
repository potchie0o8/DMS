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
    int TenantID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            TenantID = int.Parse(Session["TenantID"].ToString());
            LoadData(TenantID);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void LoadData(int _TenantID) 
    {
        lblTenantID.Text = _TenantID.ToString();
        string strSelect = "SELECT FName, MName, LName, Gender, Email, BDate, Street + ', ' + City + '  ' + Region + '  ' + Country AS 'Address', MobileNo, UN, PhotoFile, DateRegistered, FingerprintID FROM Tenants WHERE TenantID=@TID";
        SqlParameter[] TID = { new SqlParameter("@TID", _TenantID) };
        SqlDataReader dr = DataAccess.ReturnReader(strSelect, TID, ConnString);
        dr.Read();
        lblAddress.Text = dr["Address"].ToString();
        lblContactNo.Text = dr["MobileNo"].ToString();
        lblDateOfBirth.Text = Convert.ToDateTime(dr["BDate"].ToString()).ToString("MMMM dd, yyyy");
        lblDateRegistered.Text = dr["DateRegistered"].ToString();
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