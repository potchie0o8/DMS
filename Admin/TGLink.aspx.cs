using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Globals;
using System.Data.SqlClient;
using CustomStrings;
using DBHelpers;
using Auditor;

public partial class Admin_TGLink : System.Web.UI.Page
{
    string conString = StaticVariables.ConnectionString;
    int EmployeeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID = int.Parse(Session["EmployeeID"].ToString());
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO TGLink (TenantID, GuardianID, Relation) VALUES (@TID, @GID, @relation)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@TID", AntiXSSMethods.CleanString(ddlTenant.SelectedValue)),
                                         new SqlParameter("@GID", AntiXSSMethods.CleanString(ddlGuardian.SelectedValue)),
                                         new SqlParameter("@relation", AntiXSSMethods.CleanString(txtRelation.Text))
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        AuditTrailFunctions.UpdateEmployeeAuditTrail("Added new Tenant link to Guardian", EmployeeID);
        Response.Redirect("GuardianMgt.aspx");
    }
}