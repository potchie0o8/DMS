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

public partial class Admin_AddMessage : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int EmployeeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            EmployeeID = int.Parse(Session["EmployeeID"].ToString());
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO Messages (EmployeeID, TenantID, Subject, Message) VALUES (@EID, @TID, @subject, @message)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@EID", EmployeeID),
                                         new SqlParameter("@TID", AntiXSSMethods.CleanString(ddlTenant.SelectedValue)),
                                         new SqlParameter("@subject", AntiXSSMethods.CleanString(txtSubject.Text)),
                                         new SqlParameter("@message", AntiXSSMethods.CleanString(txtMsg.Text))
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        Response.Write("<script>alert('Message sent!');</script>");
    }
}