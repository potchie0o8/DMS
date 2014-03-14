using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;

public partial class Admin_Complaints : System.Web.UI.Page
{
    string connString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int ComplaintID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ComplaintID = int.Parse(Request.QueryString["ID"]);
            if (!IsPostBack)
            {
                loaddata(ComplaintID);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void loaddata(int _ComplaintID)
    {
        SqlParameter[] ComplaintID = { new SqlParameter("@complaintID", _ComplaintID) };
        SqlDataReader dr = DataAccess.ReturnReader("SELECT Complaints.ComplaintID, Tenants.LName + ',  ' + Tenants.FName + '  ' + Tenants.MName AS 'FullName', Complaints.Subject, Complaints.Details, Complaints.Date, Complaints.Status FROM Complaints INNER JOIN Tenants ON Complaints.TenantID = Tenants.TenantID WHERE Complaints.ComplaintID=@complaintID", ComplaintID, connString);
        dr.Read();
        lblTenant.Text = dr["FullName"].ToString();
        lblDate.Text = dr["Date"].ToString();
        lblSubject.Text = dr["Subject"].ToString();
        lblDetail.Text = Server.HtmlDecode(dr["Details"].ToString());
        ddlStatus.SelectedValue = dr["Status"].ToString();
        DataAccess.ForceConnectionToClose();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string strUpdate = "UPDATE Complaints SET Status=@status WHERE ComplaintID=@CID";
        SqlParameter[] updateParam = {
                                         new SqlParameter("@status", ddlStatus.SelectedValue),
                                         new SqlParameter("@CID", ComplaintID)
                                     };
        DataAccess.DataProcessExecuteNonQuery(strUpdate, updateParam, connString);
        lblAlert.Text = "Complaint status updated";
    }
}