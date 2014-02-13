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

public partial class Tenant_ServiceRequest : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int TenantID;
    string remarks, priority;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            TenantID = int.Parse(Session["TenantID"].ToString());
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

        remarks = "On Going";
        priority = "Average";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO ServiceRequest (TenantID, Title, Details, Remarks, Priority) VALUES (@TID, @title, @details, @remarks, @priority)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@TID", TenantID),
                                         new SqlParameter("@title", AntiXSSMethods.CleanString(txtTitle.Text)),
                                         new SqlParameter("@details", AntiXSSMethods.CleanString(txtDetails.Text)),
                                         new SqlParameter("@remarks", remarks),
                                         new SqlParameter("@priority", priority)
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        Response.Write("<script>alert('Success!');</script>");
    }
}