using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;

public partial class Tenant_ViewServiceRequest : System.Web.UI.Page
{
    string connString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int ServiceRequestID;
    protected void Page_Load(object sender, EventArgs e)
    {
        ServiceRequestID = int.Parse(Request.QueryString["ID"]);
        loaddata(ServiceRequestID);
    }

    private void loaddata(int _SRID)
    {
        SqlParameter[] SRID = { new SqlParameter("@srid", _SRID) };
        SqlDataReader dr = DataAccess.ReturnReader("Select * FROM ServiceRequest WHERE ServiceRequestID=@srid", SRID, connString);
        dr.Read();
        lblTitle.Text = dr["Title"].ToString();
        lblDetails.Text = dr["Details"].ToString();
        lblRemarks.Text = dr["Remarks"].ToString();
        lblPriority.Text = dr["Priority"].ToString();
        lblDateRequested.Text = dr["DateRequested"].ToString();
        lblDateCompleted.Text = dr["DateCompleted"].ToString();
        DataAccess.ForceConnectionToClose();
    }
}