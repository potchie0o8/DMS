using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tenant_ServiceRequestMgt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grd_ServiceRequest_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("ViewServiceRequest.aspx?ID=" + grd_ServiceRequest.SelectedDataKey["ServiceRequestID"].ToString());
    }
}