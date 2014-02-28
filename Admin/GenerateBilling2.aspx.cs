using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Globals;
using DBHelpers;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_GenerateBilling2 : System.Web.UI.Page
{
    string ConnString = StaticVariables.ConnectionString;
    int TenantID, ContractID;

    int PeriodType; //1 - Annual, 2 - Monthly, 3 - Daily
    double Fee;
    string RateType;


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //Gets Tenant and displays to lblTenant
            TenantID = int.Parse(Request.QueryString["ID"].ToString());
            string strGetTenant = "SELECT LName + ', ' + FName + ' ' + MName + ' (' + CONVERT(nvarchar(7), TenantID) + ')' AS 'FullName' FROM Tenants WHERE TenantID=@TID";
            SqlParameter[] TID = { new SqlParameter("@TID", TenantID) };
            lblTenant.Text = DataAccess.ReturnData(strGetTenant, TID, ConnString, "FullName");

            GetPeriodicalFee(TenantID);

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("GenerateBilling.aspx");
    }
    protected void btnRecordPayment_Click(object sender, EventArgs e)
    {
        //I need bill ID... to follow
        Response.Redirect("BillPayment.aspx?ID=");
    }

    //get rent fee
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


    //

}