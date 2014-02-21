using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using CustomStrings;
using DBHelpers;

public partial class Admin_RegAsset : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private bool checkInputs()
    {
        if (ddlTenant.SelectedValue.Trim() == "")
        {
            return false;
        }
        if (ddlType.SelectedValue.Trim() == "")
        {
            return false;
        }
        if (txtModel.Text.Trim() == "")
        {
            return false;
        }
        if (txtBrand.Text.Trim() == "")
        {
            return false;
        }
        if (txtSerial.Text.Trim() == "")
        {
            return false;
        }
        if (txtAmount.Text.Trim() == "")
        {
            return false;
        }

        try
        {
            Convert.ToDouble(txtAmount.Text.Trim());
        }
        catch
        {
            return false;
        }

        return true;
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        if (checkInputs())
        {
            string strInsert = "INSERT INTO Assets (TenantID, AssetType, ModelName, BrandName,SerialNo, Amount) VALUES (@tid, @type, @model, @brand, @serial, @amount)";
            SqlParameter[] insertParam = {
                                         new SqlParameter("@tid", AntiXSSMethods.CleanString(ddlTenant.SelectedValue)),
                                         new SqlParameter("@type", AntiXSSMethods.CleanString(ddlType.SelectedValue)),
                                         new SqlParameter("@model", AntiXSSMethods.CleanString(txtModel.Text)),
                                         new SqlParameter("@brand", AntiXSSMethods.CleanString(txtBrand.Text)),
                                         new SqlParameter("@serial", AntiXSSMethods.CleanString(txtSerial.Text)),
                                         new SqlParameter("@amount", StringCustomizers.CheckMoney(Convert.ToDouble(AntiXSSMethods.CleanString(txtAmount.Text))))
                                     };
            DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
            Response.Redirect("~/Admin/ManageAssets.aspx");
        }
        else
        {
            lblAlert.Text = "Please check your input fields for invalid entries";
        }
    }
}