using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Globals;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;
using Auditor;

public partial class Admin_ManageAsset : System.Web.UI.Page
{
    string connString = StaticVariables.ConnectionString;
    int AssetID, EmployeeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID = int.Parse(Session["EmployeeID"].ToString());
        AssetID = int.Parse(Request.QueryString["ID"]);
        if (!IsPostBack)
        {
            loaddata(AssetID);
        }
    }
    private void loaddata(int _AID)
    {
        SqlParameter[] AID = {
                                 new SqlParameter("@AID", _AID)
                             };
        SqlDataReader dr = DataAccess.ReturnReader("SELECT Assets.AssetID, Assets.AssetType, Assets.ModelName, Assets.BrandName, Assets.SerialNo, Assets.Amount, Tenants.LName + ',  ' + Tenants.FName + '  ' + Tenants.MName AS 'TenantName' FROM Assets INNER JOIN Tenants ON Assets.TenantID = Tenants.TenantID", AID, connString);
        dr.Read();
        lblAssetID.Text = dr["AssetID"].ToString();
        lblTenant.Text = dr["TenantName"].ToString();
        lblType.Text = dr["AssetType"].ToString();
        lblModel.Text = dr["ModelName"].ToString();
        lblBrand.Text = dr["BrandName"].ToString();
        lblSerial.Text = dr["SerialNo"].ToString();
        txtAmount.Text = dr["Amount"].ToString();
        DataAccess.ForceConnectionToClose();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string strUpdate = "UPDATE Assets SET Amount=@amount WHERE AssetID=@AID";
        SqlParameter[] updateParam = { 
                                         new SqlParameter("@AID", AssetID),
                                         new SqlParameter("@amount",Convert.ToDouble(txtAmount.Text))
                                     };
        DataAccess.DataProcessExecuteNonQuery(strUpdate, updateParam, connString);
        AuditTrailFunctions.UpdateEmployeeAuditTrail("Updated assets amount", EmployeeID);
        loaddata(AssetID);
        lblAlert.Text = "Successfully Updated!";
        
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string strDelete = "DELETE FROM Assets WHERE AssetID=@AID";
        SqlParameter[] delParam = { new SqlParameter("@AID", AssetID) };
        DataAccess.DataProcessExecuteNonQuery(strDelete, delParam, connString);
        AuditTrailFunctions.UpdateEmployeeAuditTrail("Deleted asset!", EmployeeID);
        Response.Redirect("ManageAssets.aspx");
    }
}