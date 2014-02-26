using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Globals;
using DBHelpers;
using System.Data.SqlClient;


public partial class Admin_GenerateBilling : System.Web.UI.Page
{

    string ConnString = StaticVariables.ConnectionString; 
    DateTime DateTimeNow = DateTime.Now;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string GetGender(int _Gender)
    {
        return IntToWords.getGender(_Gender);
    }

    //Gets the total of the total amout per unpaid bill
    public string GetBalance(int _TenantID)
    {
        double UnpaidBalance = 0;
        string strGetBal = "SELECT TotalAmount FROM Bills WHERE ((IsPaid=0 OR IsPaid IS NULL) AND (IsFinalized=1)) AND (TenantID=@TID)";
        SqlParameter[] TID = { new SqlParameter("@TID", _TenantID) };
        SqlDataReader dr = DataAccess.ReturnReader(strGetBal, TID, ConnString);
        while (dr.Read())
        {
            double TotalBalPerBill = Convert.ToDouble(dr["TotalAmount"].ToString());
            UnpaidBalance = UnpaidBalance + TotalBalPerBill;
        }
        DataAccess.ForceConnectionToClose();
        return "Php " + UnpaidBalance.ToString();
        
        //double UnpaidBalance = 1000.00;
        //return "Php " + UnpaidBalance.ToString();
    }


}