using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ComplaintMgt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getStatus(int _statusID)
    {
        string status = "";
        switch (_statusID)
        {
            case 1:
                status = "Pending";
                break;
            case 2:
                status = "";
                break;
        }
        return status;
    }
    protected void grdComplaint_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("Complaints.aspx?ID=" + grdComplaint.SelectedDataKey["ComplaintID"].ToString());
    }
}