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

public partial class Tenant_AddComplaint : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int TenantID, status;
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

        status = 1;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO Complaints (TenantID, Subject, Details, Status) VALUES (@TID, @subj, @details, @status)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@TID", TenantID),
                                         new SqlParameter("@subj", AntiXSSMethods.CleanString(txtSubject.Text)),
                                         new SqlParameter("@details", AntiXSSMethods.CleanString(txtMsg.Text)),
                                         new SqlParameter("@status", status)
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        Response.Write("<script>alert('Success!');</script>");

        if (IsPostBack)
        {
            txtSubject.Text = "";
            txtMsg.Text = "";
        }
    }
}