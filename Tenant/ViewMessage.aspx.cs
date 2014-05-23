using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;

public partial class Tenant_ViewMessage : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int MessageID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            MessageID = int.Parse(Request.QueryString["ID"]);
            if (!IsPostBack)
            {
                loaddata(MessageID);
            }
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void loaddata(int _MID)
    {
        SqlParameter[] MID = {
                                 new SqlParameter("@MID", _MID)
                             };
        SqlDataReader dr = DataAccess.ReturnReader("SELECT Messages.Subject, Messages.Message, Messages.Date, Employees.LName + ',  ' + Employees.FName + '  ' + Employees.MName AS 'FullName' FROM Messages INNER JOIN Employees ON Messages.EmployeeID=Employees.EmployeeID  WHERE Messages.MessageID=@MID", MID, conString);
        dr.Read();
        lblSubject.Text = dr["Subject"].ToString();
        lblDate.Text = Convert.ToDateTime(dr["Date"].ToString()).ToShortDateString();
        lblSender.Text = dr["FullName"].ToString();
        lblMsg.Text = Server.HtmlDecode(dr["Message"].ToString());
        DataAccess.ForceConnectionToClose();
    }
}