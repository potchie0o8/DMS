using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guardian_ViolationMgt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        if (ddlTenant.SelectedValue != "")
        {
            int SelectedTenant = Convert.ToInt32(ddlTenant.SelectedValue);

            sql_Violation.SelectCommand = "SELECT Tenants.LName + ',  ' + Tenants.FName + '  ' + Tenants.MName AS 'TenantName', Violations.Title, Violations.Fine, Violations.DateTime FROM Violations INNER JOIN Tenants ON Violations.TenantID = Tenants.TenantID WHERE Tenants.TenantID=@TID";
            sql_Violation.SelectParameters.Clear();
            sql_Violation.SelectParameters.Add(new Parameter("TID", System.Data.DbType.Int32, SelectedTenant.ToString()));
            sql_Violation.DataBind();
            grdViolations.DataSourceID = string.Empty;
            grdViolations.DataSource = sql_Violation;
            grdViolations.DataBind();
        }
        else
        {
            grdViolations.DataSourceID = string.Empty;
            grdViolations.DataBind();
        }
    }
}