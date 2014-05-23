using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using UserManagement;
using DBHelpers;
using Globals;

public partial class MasterPage : System.Web.UI.MasterPage
{
    string ConnString = StaticVariables.ConnectionString;
    int CurrentUserID;
    public int UnreadMessagesCount;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblDate.Text = "Date: "+ DateTime.Now.Month.ToString() + "/" + DateTime.Now.Day.ToString() + "/" + DateTime.Now.Year.ToString();
        CheckUser();
    }


    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Default.aspx");
    }


    private void CheckUser()
    {
        try
        {
            CurrentUserID = int.Parse(Session["TenantID"].ToString());
            string Username = Tenants.ReturnUserName(CurrentUserID);
            UnreadMessagesCount = CountUnreadMessages(CurrentUserID);
            lblUsername.Text = Username;
        }
        catch
        {
            Session.Clear();
            Response.Redirect("~/Default.aspx");
        }
    }

    public int CountUnreadMessages(int _UserID)
    {
        string strCount = "SELECT COUNT (*) FROM Messages WHERE TenantID=@tid AND ((IsRead != 1) OR (IsRead IS NULL))";
        SqlParameter[] countParams = {
                                         new SqlParameter("@tid", _UserID)
                                     };
        return DataAccess.DetermineEntryCount(strCount, countParams, ConnString);
    }


}