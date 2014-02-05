using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;
using CustomStrings;

public partial class Admin_Announcement : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO Announcement (Subject, Message) VALUES (@subject, @message)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@subject", AntiXSSMethods.CleanString(txtSubject.Text)),
                                         new SqlParameter("@message", AntiXSSMethods.CleanString(txtMsg.Text))
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        //Response.Write("<script>alert('Success!');</script>");
        Response.Redirect("ManageAnnouncements.aspx");
    }
}