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
    int GuardianID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            GuardianID = int.Parse(Session["GuardianID"].ToString());
            LoadData(GuardianID);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void LoadData(int _GuardianID) 
    {
        lblGuardianID.Text = _GuardianID.ToString();
        string strSelect = "SELECT FName, MName, LName, Gender, BDate, ContactNo, Email, Address, UN FROM Guardians WHERE GuardianID=@GID";
        SqlParameter[] GID = { new SqlParameter("@GID", _GuardianID) };
        SqlDataReader dr = DataAccess.ReturnReader(strSelect, GID, ConnString);
        dr.Read();
        lblAddress.Text = dr["Address"].ToString();
        lblContactNo.Text = dr["ContactNo"].ToString();
        lblDateOfBirth.Text = Convert.ToDateTime(dr["BDate"].ToString()).ToString("MMMM dd, yyyy");
        lblEmailAdd.Text = dr["Email"].ToString();
        lblFName.Text = dr["FName"].ToString();
        lblGender.Text = IntToWords.getGender(int.Parse(dr["Gender"].ToString()));
        lblLName.Text = dr["LName"].ToString();
        lblMName.Text = dr["MName"].ToString();
        lblUsername.Text = dr["UN"].ToString();
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