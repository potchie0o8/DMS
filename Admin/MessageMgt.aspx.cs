using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DBHelpers;
using Globals;

public partial class Admin_MessageMgt : System.Web.UI.Page
{
    string connString = StaticVariables.ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int SelectedMessage = int.Parse(grdMsg.SelectedDataKey["MessageID"].ToString());
        loaddata(SelectedMessage);
    }

    public void loaddata(int _MID)
    {
        tblMsg.Visible = true;

        SqlParameter[] MID = { new SqlParameter("@MID", _MID) };
        SqlDataReader dr = DataAccess.ReturnReader("SELECT Messages.Subject, Messages.Message, Messages.Date, Employees.LName + ',  ' + Employees.FName + '  ' + Employees.MName AS 'FullName' FROM Messages INNER JOIN Employees ON Messages.EmployeeID=Employees.EmployeeID  WHERE Messages.MessageID=@MID", MID, connString);
        dr.Read();
        lblSubject.Text = dr["Subject"].ToString();
        lblDate.Text = Convert.ToDateTime(dr["Date"].ToString()).ToShortDateString();
        lblSender.Text = dr["FullName"].ToString();
        lblMsg.Text = Server.HtmlDecode(dr["Message"].ToString());
        DataAccess.ForceConnectionToClose();
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        tblMsg.Visible = false;
    }

    public string IsRead(string _Value)
    {
        if (_Value == "1")
        {
            return "Read";
        }
        else
        {
            return "Unread";
        }
    }
}