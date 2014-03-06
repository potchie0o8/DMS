using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DBHelpers;
using Globals;

public partial class Admin_Accounts_GenerateBill : System.Web.UI.Page
{

    string ConnString = StaticVariables.ConnectionString;
    int TenantID, ContractID, BillID;

    int PeriodType; //1 - Annual, 2 - Monthly, 3 - Daily
    double Fee;
    string RateType;


    protected void Page_Load(object sender, EventArgs e)
    {
        TenantID = int.Parse(Request.QueryString["TID"].ToString());
        BillID = int.Parse(Request.QueryString["BID"].ToString());
        //string strGetTenant = "SELECT LName + ', ' + FName + ' ' + MName + ' (' + CONVERT(nvarchar(7), TenantID) + ')' AS 'FullName' FROM Tenants WHERE TenantID=@TID";
        //SqlParameter[] TID = { new SqlParameter("@TID", TenantID) };
        //lblTenant.Text = DataAccess.ReturnData(strGetTenant, TID, ConnString, "FullName");
        GetPeriodicalFee(TenantID);
    }

    private void GetPeriodicalFee(int _TenantID)
    {

        try
        {

            string strSelect = "SELECT * FROM Contracts WHERE TenantID=@TID AND IsValid=1";
            SqlParameter[] TID = { new SqlParameter("@TID", _TenantID) };
            SqlDataReader dr = DataAccess.ReturnReader(strSelect, TID, ConnString);
            dr.Read();
            string Period = dr["Period"].ToString();
            DateTime ContractStart = Convert.ToDateTime(dr["StartDate"].ToString());
            DateTime ContractEnd = Convert.ToDateTime(dr["EndDate"].ToString());
            ContractID = int.Parse(dr["ContractID"].ToString());
            DataAccess.ForceConnectionToClose();

            if (Period == "Annually")
            {
                RateType = "YearlyRate";
                lblContract.Text = "Yearly Scheme";
            }
            else if (Period == "Monthly")
            {
                RateType = "MonthlyRate";
                lblContract.Text = "Monthly Scheme";
            }
            else if (Period == "Daily")
            {
                RateType = "DailyRate";
                lblContract.Text = "Daily Scheme";
            }

            string strGetPrice = "SELECT UnitType." + RateType + " FROM UnitType, Contracts, BedSpaces, Rooms ";
            strGetPrice += "WHERE Contracts.BedSpaceID=BedSpaces.BedSpaceID AND BedSpaces.RoomID=Rooms.RoomID ";
            strGetPrice += "AND Rooms.UnitTypeID=UnitType.UnitTypeID AND ContractID=@CID";
            SqlParameter[] CID = { new SqlParameter("@CID", ContractID) };
            Fee = Convert.ToDouble(DataAccess.ReturnData(strGetPrice, CID, ConnString, RateType));

            if (Period == "Monthly" || Period == "Annually")
            {
                lblPeriodFee.Text = "Php " + Fee.ToString() + " per month";
            }
            else if (Period == "Daily")
            {
                lblPeriodFee.Text = "Php " + Fee.ToString() + " per day";
            }

        }
        catch
        {
            lblContract.Text = "This tenant currently has no contract information";
            lblPeriodFee.Text = "-";
        }

    }
}