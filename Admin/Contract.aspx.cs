using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using CustomStrings;
using DBHelpers;
using UserManagement;
using Accounting;

public partial class Admin_Contract : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int EmployeeID, TenantID, Gender;
    double Fee;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            EmployeeID = int.Parse(Session["EmployeeID"].ToString());
            TenantID = int.Parse(Request.QueryString["ID"]);
            Gender = Tenants.GetTenantGender(TenantID);

            if (!IsPostBack)
            {

                string strSelectUnit = "SELECT UnitTypeID, UnitTypeName + ' for ' + CASE WHEN Gender=1 THEN 'Male' ELSE 'Female' END AS 'Name' FROM UnitType";

                if (Gender == 1)
                {
                    strSelectUnit += " WHERE UnitType.Gender=1";
                }
                else if (Gender == 2)
                {
                    strSelectUnit += " WHERE UnitType.Gender=2";
                }

                SqlDS_UnitType.SelectCommand = strSelectUnit;
                SqlDS_UnitType.DataBind();
                ddlUnit.Items.Clear();
                ddlUnit.Items.Add(new ListItem("- Select -", ""));
                ddlUnit.DataBind();
            }



        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private int checkInputs()
    {
        //0 - good
        //1 - invalid start date
        //2 - invalid end date
        //3 - blank inputs
        bool StartDateIsValid = StringCustomizers.checkDate(AntiXSSMethods.CleanString(txtDateStart.Text));
        bool EndDateIsValid = StringCustomizers.checkDate(AntiXSSMethods.CleanString(txtEndDate.Text));

        if (!StartDateIsValid) 
        {
            return 1;
        }

        if (!EndDateIsValid)
        {
            return 2;
        }

        if (txtDateStart.Text.Trim() == "")
        {
            return 3;
        }
        if (txtEndDate.Text.Trim() == "")
        {
            return 3;
        }

        if (ddlBedside.SelectedValue.Trim() == "")
        {
            return 3;
        }
        if (ddlPeriod.SelectedValue.Trim() == "")
        {
            return 3;
        }
        if (ddlRoom.SelectedValue.Trim() == "")
        {
            return 3;
        }
        if (ddlUnit.SelectedValue.Trim() == "")
        {
            return 3;
        }

        return 0;

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        int validateInputs = checkInputs();
        if (validateInputs == 0)
        {
            //string strInsert = "INSERT INTO Contracts (TenantID, UnitTypeID, RoomID, BedSpaceID, Period, StartDate, EmployeeID, EndDate) VALUES (@tid, @utid, @rid, @bsid, @period, @startDate, @eid, @endDate)";
            string strInsert = "INSERT INTO Contracts (TenantID, BedSpaceID, Period, StartDate, EmployeeID, EndDate, IsValid) VALUES (@tid, @bsid, @period, @startDate, @eid, @endDate, @IsValid)";
            SqlParameter[] insertParam = {
                                         new SqlParameter("@tid", TenantID),
                                         //new SqlParameter("@utid", AntiXSSMethods.CleanString(ddlUnit.SelectedValue)),
                                         //new SqlParameter("@rid", AntiXSSMethods.CleanString(ddlRoom.SelectedValue)),
                                         new SqlParameter("@bsid", AntiXSSMethods.CleanString(ddlBedside.SelectedValue)),
                                         new SqlParameter("@period", AntiXSSMethods.CleanString(ddlPeriod.SelectedValue)),
                                         new SqlParameter("@startDate", AntiXSSMethods.CleanString(txtDateStart.Text)),
                                         new SqlParameter("@eid", EmployeeID),
                                         new SqlParameter("@endDate", AntiXSSMethods.CleanString(txtEndDate.Text)),
                                         new SqlParameter("@IsValid", true)
                                     };
            DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
            //Response.Redirect("~/Admin/ManageTenant.aspx");

            //INSERTS TWO MONTHS ADVANCE PAYMENT

            if (ddlPeriod.SelectedValue == "Annually")
            {
                //Get Fee

                string strGetFee = "SELECT UnitType.MonthlyRate FROM BedSpaces INNER JOIN Rooms ON BedSpaces.RoomID = Rooms.RoomID INNER JOIN UnitType ON Rooms.UnitTypeID = UnitType.UnitTypeID WHERE (BedSpaces.BedSpaceID = @BSID)";

                SqlParameter[] BSID = { new SqlParameter("@BSID", AntiXSSMethods.CleanString(ddlBedside.SelectedValue)) };
                double MonthlyFee = double.Parse(DataAccess.ReturnData(strGetFee, BSID, conString, "MonthlyRate"));


                double TotalSecurityDeposit = MonthlyFee * 2;

                //Insert Bill
                int NewBillID = AcctFunctions.GenerateNewBill(TenantID, EmployeeID);
                AcctFunctions.InsertBillItem(NewBillID, "TWO MONTHS RENTAL FEE - SECURITY DEPOSIT", TotalSecurityDeposit);
                AcctFunctions.TotalAndFinalizeBill(NewBillID);
            }



            Response.Redirect("~/Admin/ContractMgt.aspx");
        }
        else if (validateInputs == 3)
        {
            lblAlert.Text = "Check fields for blank entries";
        }
        else if (validateInputs == 1)
        {
            lblAlert.Text = "Invalid start date!";
        }
        else if (validateInputs == 2)
        {
            lblAlert.Text = "Invalid end date";
        }
    }
    protected void ddlPeriod_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (StringCustomizers.checkDate(txtDateStart.Text))
        {
            if (ddlPeriod.SelectedValue == "Annually")
            {
                txtEndDate.Enabled = false;
                txtEndDate.Text = Convert.ToDateTime(txtDateStart.Text).AddYears(1).ToShortDateString();
            }
            else if (ddlPeriod.SelectedValue == "Monthly")
            {
                txtEndDate.Enabled = true;
                txtEndDate.Text = Convert.ToDateTime(txtDateStart.Text).AddMonths(1).ToShortDateString();
            }
            else if (ddlPeriod.SelectedValue == "Daily")
            {
                txtEndDate.Enabled = true;
                txtEndDate.Text = Convert.ToDateTime(txtDateStart.Text).AddDays(1).ToShortDateString();
            }
        }
        else
        {
            lblAlert.Text = "Invalid end date!";
        }
    }
    protected void ddlUnit_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strSelectRoom = "SELECT Rooms.RoomID, Rooms.RoomNo + ' ' + UnitType.UnitTypeName AS 'Name' FROM Rooms INNER JOIN UnitType ON Rooms.UnitTypeID = UnitType.UnitTypeID";
        strSelectRoom += " WHERE Rooms.UnitTypeID='" + ddlUnit.SelectedValue + "'";

        if (Gender == 1)
        {
            strSelectRoom += " AND UnitType.Gender=1";
        }
        else if (Gender == 2)
        {
            strSelectRoom += " AND UnitType.Gender=2";
        }

        SqlDS_Rooms.SelectCommand = strSelectRoom;
        SqlDS_Rooms.DataBind();
        ddlRoom.Items.Clear();
        ddlRoom.Items.Add(new ListItem("- Select -", ""));
        ddlRoom.DataBind();
    }
    protected void ddlRoom_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strSelect = "SELECT BedSpaces.BedSpaceID, Rooms.RoomNo + '  ' + UnitType.UnitTypeName + '  ' + CASE WHEN BedSide = 1 THEN 'Left/Top' ELSE 'Right/Bottom' END AS 'Name' FROM BedSpaces INNER JOIN Rooms ON BedSpaces.RoomID = Rooms.RoomID INNER JOIN UnitType ON Rooms.UnitTypeID = UnitType.UnitTypeID";
        strSelect += " WHERE Rooms.RoomID='" + ddlRoom.SelectedValue + "'";

        SqlDS_BedSide.SelectCommand = strSelect;
        SqlDS_BedSide.DataBind();

        ddlBedside.Items.Clear();
        ddlBedside.Items.Add(new ListItem("- Select -", ""));
        ddlBedside.DataBind();

    }
}