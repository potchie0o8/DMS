using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Globals;
using CustomStrings;
using System.Data.SqlClient;
using System.Data;
using DBHelpers;

public partial class Admin_ManageTenants : System.Web.UI.Page
{
    string connString = StaticVariables.ConnectionString;
    int CurrentUserID;
    protected void Page_Load(object sender, EventArgs e)
    {
        CurrentUserID = int.Parse(Session["EmployeeID"].ToString());
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
        string strSelect = "SELECT * FROM Tenants WHERE " + ddlSearch.SelectedValue + " LIKE @entry ORDER BY TenantID DESC";
        SqlParameter[] SearchVal = { new SqlParameter("@entry", "%" + AntiXSSMethods.CleanString(txtSearch.Text) + "%") };
        DataSet ds = DataAccess.DataProcessReturnData(strSelect, SearchVal, connString);

        GrdTenants.DataSourceID = string.Empty;
        GrdTenants.DataSource = ds;
        GrdTenants.DataBind();
    }
}