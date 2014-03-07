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

        //sets Violations
        SqlDS_Violations.SelectCommand = "SELECT Employees.UN, Violations.Title, Violations.Description, Violations.Fine, Violations.DateTime FROM Violations INNER JOIN Employees ON Violations.EmployeeID = Employees.EmployeeID WHERE (Violations.TenantID = @TID) AND (Violations.Fine!='' OR Violations.Fine!=0 OR Violations.Fine IS NOT NULL)";


        TenantID = int.Parse(Request.QueryString["TID"].ToString());
        BillID = int.Parse(Request.QueryString["BID"].ToString());
        //string strGetTenant = "SELECT LName + ', ' + FName + ' ' + MName + ' (' + CONVERT(nvarchar(7), TenantID) + ')' AS 'FullName' FROM Tenants WHERE TenantID=@TID";
        //SqlParameter[] TID = { new SqlParameter("@TID", TenantID) };
        //lblTenant.Text = DataAccess.ReturnData(strGetTenant, TID, ConnString, "FullName");
        GetPeriodicalFee(TenantID);
    }


    //private void GetPreviousBalance(int _TenantID)
    //{


    //}


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
            lnkBtnAddRent.Enabled = false;
            lnkBtnAddRent.Text = "No Rent Fee to Add";
        }

    }
    protected void lnkBtnAddRent_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO Bill_Items (BillID, Particular, Amount) VALUES (@BID, @PAR, @AMT)";

        SqlParameter[] BillItems = {
                                       new SqlParameter("@BID", BillID),
                                       new SqlParameter("@PAR", "RENT FEE"),
                                       new SqlParameter("@AMT", Fee)
                                   };
        DataAccess.DataProcessExecuteNonQuery(strInsert, BillItems, ConnString);
        GRD_BillItems.DataBind();
    }
    protected void btnCreateBill_Click(object sender, EventArgs e)
    {
        double totalAmt = 0;

        //computes total amount from bill
        string strGetTotalAmt = "SELECT Amount FROM Bill_Items WHERE BillID=@BID";
        SqlParameter[] BIDParam = { new SqlParameter("@BID", BillID) };

        SqlDataReader dr = DataAccess.ReturnReader(strGetTotalAmt, BIDParam, ConnString);
        while (dr.Read())
        {
            double Total = Convert.ToDouble(dr["Amount"].ToString());
            totalAmt = totalAmt + Total;
        }
        DataAccess.ForceConnectionToClose();


        //insert items and mark things as paid
        try
        {
            SqlParameter[] BillParams = { 
                                            new SqlParameter("@BID", BillID),
                                            new SqlParameter("@GenDate", DateTime.Now),
                                            new SqlParameter("@Total", totalAmt)
                                        };
            DataAccess.DataProcessExecuteNonQuery("UPDATE Bills SET IsFinalized=1, DateGenerated=@GenDate, TotalAmount=@Total, IsPaid=0 WHERE BillID=@BID", BillParams, ConnString);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}