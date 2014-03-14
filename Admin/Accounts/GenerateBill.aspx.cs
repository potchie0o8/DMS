using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DBHelpers;
using Globals;
using Accounting;

public partial class Admin_Accounts_GenerateBill : System.Web.UI.Page
{

    string ConnString = StaticVariables.ConnectionString;
    int TenantID, ContractID, BillID;

    int PeriodType; //1 - Annual, 2 - Monthly, 3 - Daily, 4 - No Valid Contract
    double Fee, UnpaidBal;
    string RateType;

    DateTime ContractStart, ContractEnd;
    DateTime Now = DateTime.Now;


    protected void Page_Load(object sender, EventArgs e)
    {
        TenantID = int.Parse(Request.QueryString["TID"].ToString());
        BillID = int.Parse(Request.QueryString["BID"].ToString());
        UnpaidBal = AcctFunctions.GetBalance(TenantID);
        SetDefaultItems();
    }


    private void AdjustPrice()
    {
        //since there is a four-month advance rule...
    }




    private void SetDefaultItems()
    {

        //for rent fees
        GetPeriodicalFee(TenantID);
        if (PeriodType == 1 || PeriodType == 2)
        {
            //Adds Rent Fee To Bill if Not Existing
            SqlParameter[] BIDParam = { new SqlParameter("@BID", BillID) };
            bool RentIsAlreadyInBill = DataAccess.DetermineIfExisting("SELECT * FROM Bill_Items WHERE Particular='MONTHLY RENT FEE' AND BillID=@BID", BIDParam, ConnString);
            if (!RentIsAlreadyInBill)
            {
                InsertItems(BillID, "MONTHLY RENT FEE", Fee);
            }
        }
        else if (PeriodType == 3)
        {
            SqlParameter[] BIDParam = { new SqlParameter("@BID", BillID) };
            bool RentIsAlreadyInBill = DataAccess.DetermineIfExisting("SELECT * FROM Bill_Items WHERE Particular='DAILY RENT FEES' AND BillID=@BID", BIDParam, ConnString);
            if (!RentIsAlreadyInBill)
            {
                //Adds Rent Fee To Bill if Not Existing
                int NoOfDays = (ContractEnd - ContractStart).Days;
                double TotalFee = Convert.ToDouble(NoOfDays) * Fee;
                InsertItems(BillID, "DAILY RENT FEES", TotalFee);
            }
        }

        //SETS VIOLATIONS
        SqlDS_Violations.SelectCommand = "SELECT Employees.UN, Violations.Title, Violations.Description, Violations.Fine, Violations.DateTime FROM Violations INNER JOIN Employees ON Violations.EmployeeID = Employees.EmployeeID WHERE (Violations.TenantID = @TID) AND (Violations.Fine!='' OR Violations.Fine!=0 OR Violations.Fine IS NOT NULL)";

        //For Prev. Balances
        if (UnpaidBal != 0)
        {

            //Adds Rent Fee To Bill if Not Existing
            SqlParameter[] BIDParam = { new SqlParameter("@BID", BillID) };
            bool BalIsAlreadyInBill = DataAccess.DetermineIfExisting("SELECT * FROM Bill_Items WHERE Particular='UNSETTLED BALANCE' AND BillID=@BID", BIDParam, ConnString);
            if (!BalIsAlreadyInBill)
            {
                if (PeriodType == 1 || PeriodType == 2)
                {
                    InsertItems(BillID, "UNSETTLED BALANCE", UnpaidBal + (Fee * 0.15));
                }
                else
                {
                    InsertItems(BillID, "UNSETTLED BALANCE", UnpaidBal);
                }
            }

            if (PeriodType == 1 || PeriodType == 2)
            {
                lblPrevBalance.Text = "Php " + UnpaidBal.ToString() + " + Penalty: Php " + (Fee * 0.15);
            }
            else
            {
                lblPrevBalance.Text = "Php " + UnpaidBal.ToString();
            }
        }
        else
        {
            lblPrevBalance.Text = "No unsettled balance.";
        }






        GRD_BillItems.DataBind();
    }



    private void InsertItems(int _BillID, string _Title, double _Amount)
    {
        string strInsert = "INSERT INTO Bill_Items (BillID, Particular, Amount) VALUES (@BID, @PAR, @AMT)";
        SqlParameter[] BillItems = {
                                    new SqlParameter("@BID", _BillID),
                                    new SqlParameter("@PAR", _Title),
                                    new SqlParameter("@AMT", _Amount)
                                };
        DataAccess.DataProcessExecuteNonQuery(strInsert, BillItems, ConnString);
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
            ContractStart = Convert.ToDateTime(dr["StartDate"].ToString());
            ContractEnd = Convert.ToDateTime(dr["EndDate"].ToString());
            ContractID = int.Parse(dr["ContractID"].ToString());
            DataAccess.ForceConnectionToClose();

            if (Period == "Annually")
            {
                RateType = "YearlyRate";
                PeriodType = 1;
                lblContract.Text = "Yearly Scheme";
            }
            else if (Period == "Monthly")
            {
                RateType = "MonthlyRate";
                PeriodType = 2;
                lblContract.Text = "Monthly Scheme";
                
            }
            else if (Period == "Daily")
            {
                RateType = "DailyRate";
                PeriodType = 3;
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
            PeriodType = 4;
            lblContract.Text = "This tenant currently has no contract information";
            lblPeriodFee.Text = "-";
        }
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

    protected void GRD_VIOLATIONS_SelectedIndexChanged(object sender, EventArgs e)
    {
        InsertItems(BillID, GRD_VIOLATIONS.SelectedDataKey["Title"].ToString(), Convert.ToDouble(GRD_VIOLATIONS.SelectedDataKey["Fine"].ToString()));
        GRD_BillItems.DataBind();
    }

    protected void GRD_ASSETS_SelectedIndexChanged(object sender, EventArgs e)
    {
        InsertItems(BillID, "Asset Fee: " + GRD_ASSETS.SelectedDataKey["AssetType"].ToString(), Convert.ToDouble(GRD_ASSETS.SelectedDataKey["Amount"].ToString()));
        GRD_BillItems.DataBind();
    }
}