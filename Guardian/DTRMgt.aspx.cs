using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guardian_DTRMgt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnView_Click(object sender, EventArgs e)
    {

        if (ddlTenant.SelectedValue != "")
        {
            int SelectedTenant = Convert.ToInt32(ddlTenant.SelectedValue);
            //Response.Write(SelectedTenant.ToString());

            sql_DTR.SelectCommand = "SELECT Tenants.LName + ',  ' + Tenants.FName + '  ' + Tenants.MName AS 'TenantName', DTR.EntryType, DTR.Remarks, DTR.DateTime FROM DTR INNER JOIN Tenants ON DTR.TenantID = Tenants.TenantID WHERE Tenants.TenantID=@TID ORDER BY DateTime DESC";
            sql_DTR.SelectParameters.Clear();
            sql_DTR.SelectParameters.Add(new Parameter("TID", System.Data.DbType.Int32, SelectedTenant.ToString()));
            sql_DTR.DataBind();
            grdDRT.DataSourceID = string.Empty;
            grdDRT.DataSource = sql_DTR;
            grdDRT.DataBind();
        }
        else
        {
            grdDRT.DataSourceID = string.Empty;
            grdDRT.DataBind();
        }
    }
}