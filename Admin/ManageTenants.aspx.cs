using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;
using System.Data;
using Globals;

public partial class Admin_ManageTenants : System.Web.UI.Page
{
    string connString = StaticVariables.ConnectionString;
    int CurrentUserID;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //CurrentUserID = int.Parse(Session["TenantID"].ToString());

            //if (!IsPostBack)
            //{
            //    SqlDS_Tenants.SelectCommand = "SELECT * FROM [Tenants] WHERE TenantID !='" + CurrentUserID.ToString() + "'  ORDER BY TenantID DESC";

            //}

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        

    }

    

    public string getGender(int _genderID)
    {
        string gender = "";
        switch (_genderID)
        {
            case 1:
                gender = "Male";
                break;
            case 2:
                gender = "Female";
                break;
        }
        return gender;
    }
    protected void GrdTenants_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("ViewTenants.aspx?ID=" + GrdTenants.SelectedDataKey["TenantID"].ToString());
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (ddlSearch.SelectedValue != "")
        {
            string strSelect = "SELECT * FROM Tenants WHERE " + AntiXSSMethods.MakeStringSafeForSQL(ddlSearch.SelectedValue) + " LIKE @entry AND TenantID !='" + CurrentUserID.ToString() + "'  ORDER BY TenantID DESC";
            SqlParameter[] SearchVal = { new SqlParameter("@entry", "%" + AntiXSSMethods.CleanString(txtSearch.Text) + "%") };
            DataSet ds = DataAccess.DataProcessReturnData(strSelect, SearchVal, connString);

            GrdTenants.DataSourceID = string.Empty;
            GrdTenants.DataSource = ds;
            GrdTenants.DataBind();
        }
        else
        {

        }


    }
}