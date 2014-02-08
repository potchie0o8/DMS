using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBHelpers;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_ViewAnnouncements : System.Web.UI.Page
{

    int AnnouncementID;

    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            AnnouncementID = int.Parse(Request.QueryString["ID"]);
            loaddata(AnnouncementID);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }


    private void loaddata(int _AID)
    {
        string strSelect = "SELECT * FROM Announcement WHERE AnnouncementID=@AID";
        SqlParameter[] ID = { new SqlParameter("@AID", _AID) };
        SqlDataReader dr = DataAccess.ReturnReader(strSelect, ID, conString);
        dr.Read();

        txtSubject.Text = dr["Subject"].ToString();
        txtMsg.Text = Server.HtmlDecode(dr["Message"].ToString());
        lblDatePosted.Text = dr["DateCreated"].ToString();

        dr.Close();

        DataAccess.ForceConnectionToClose();
    }
}