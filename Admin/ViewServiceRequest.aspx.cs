using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;
using UserManagement;
using CustomStrings;
using Auditor;

public partial class Admin_ViewServiceRequest : System.Web.UI.Page
{
    string connString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int ServiceRequestID;
    int EmployeeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID = int.Parse(Session["EmployeeID"].ToString());
        ServiceRequestID = int.Parse(Request.QueryString["ID"]);
        if (!IsPostBack)
        {
            loaddata(ServiceRequestID);
            
        }
    }

    private void loaddata(int _SRID)
    {
       SqlParameter[] SRID = { new SqlParameter("@srid", _SRID) };
       SqlDataReader dr = DataAccess.ReturnReader("Select * FROM ServiceRequest WHERE ServiceRequestID=@srid", SRID, connString);
       dr.Read();
       lblTenant.Text = dr["TenantID"].ToString();
       lblTitle.Text = dr["Title"].ToString();
       lblDetails.Text = dr["Details"].ToString();
       lblDateRequested.Text = dr["DateRequested"].ToString();
       ddlEmp.SelectedValue = dr["EmployeeID"].ToString();
       ddlRemarks.SelectedValue = dr["Remarks"].ToString();
       ddlPriority.SelectedValue = dr["Priority"].ToString();
       txtDateCompleted.Text = dr["DateCompleted"].ToString();
       DataAccess.ForceConnectionToClose();

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {            
            if (ddlRemarks.SelectedValue == "Completed")
            {
                txtDateCompleted.Visible = true;
                string strUpdate = "UPDATE ServiceRequest SET EmployeeID=@EID, Remarks=@remarks, Priority=@priority, DateCompleted=@dateCompleted WHERE ServiceRequestID=@SRID";
                SqlParameter[] updateParam = {
                                                 new SqlParameter("@EID", AntiXSSMethods.CleanString(ddlEmp.SelectedValue)),
                                                 new SqlParameter("@remarks", AntiXSSMethods.CleanString(ddlRemarks.SelectedValue)),
                                                 new SqlParameter("@priority", AntiXSSMethods.CleanString(ddlPriority.SelectedValue)),
                                                 new SqlParameter("@dateCompleted", AntiXSSMethods.CleanString(txtDateCompleted.Text)),
                                                 new SqlParameter("@SRID", ServiceRequestID)
                                             };
                DataAccess.DataProcessExecuteNonQuery(strUpdate, updateParam, connString);
                AuditTrailFunctions.UpdateEmployeeAuditTrail("Updated service request remarks and priority", EmployeeID);
                loaddata(ServiceRequestID);
                lblAlert.Text = "Update saved!";
            }
            else
            {
                string strUpdate = "UPDATE ServiceRequest SET EmployeeID=@EID, Remarks=@remarks, Priority=@priority WHERE ServiceRequestID=@SRID";
                SqlParameter[] updateParam = {
                                                 new SqlParameter("@EID", AntiXSSMethods.CleanString(ddlEmp.SelectedValue)),
                                                 new SqlParameter("@remarks", AntiXSSMethods.CleanString(ddlRemarks.SelectedValue)),
                                                 new SqlParameter("@priority", AntiXSSMethods.CleanString(ddlPriority.SelectedValue)),
                                                 new SqlParameter("@SRID", ServiceRequestID)
                                             };
                DataAccess.DataProcessExecuteNonQuery(strUpdate, updateParam, connString);
                AuditTrailFunctions.UpdateEmployeeAuditTrail("Updated service request remarks and priority", EmployeeID);
                loaddata(ServiceRequestID);
                lblAlert.Text = "Update saved!";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void ddlRemarks_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlRemarks.SelectedValue == "Completed")
        {
            txtDateCompleted.Visible = true;
        }
        else
        {
            txtDateCompleted.Visible = false;
        }
    }
}