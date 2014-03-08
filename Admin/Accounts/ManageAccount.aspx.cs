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
using Microsoft.Reporting.WebForms;

public partial class Admin_GenerateBilling2 : System.Web.UI.Page
{
    string ConnString = StaticVariables.ConnectionString;
    int TenantID, ContractID, EmployeeID;

    int PeriodType; //1 - Annual, 2 - Monthly, 3 - Daily
    double Fee;
    string RateType;
    string ChosenBillID;



    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //Gets Tenant and displays to lblTenant
            TenantID = int.Parse(Request.QueryString["ID"].ToString());
            EmployeeID = int.Parse(Session["EmployeeID"].ToString());
            
            string strGetTenant = "SELECT LName + ', ' + FName + ' ' + MName + ' (' + CONVERT(nvarchar(7), TenantID) + ')' AS 'FullName' FROM Tenants WHERE TenantID=@TID";
            SqlParameter[] TID = { new SqlParameter("@TID", TenantID) };
            lblTenant.Text = DataAccess.ReturnData(strGetTenant, TID, ConnString, "FullName");


            if (!IsPostBack)
            {
                SqlParameter[] TIDParam = { new SqlParameter("@TenantID", TenantID) };
                string strSelect = "SELECT TOP 1 BillID FROM Bills WHERE ((TenantID = @TenantID) AND (IsFinalized = 1)) ORDER BY DateGenerated DESC";
                ChosenBillID = DataAccess.ReturnData(strSelect, TIDParam, ConnString, "BillID");
                rebindReportViewer(ChosenBillID);
            }
            //else
            //{
            //    rebindReportViewer(ChosenBillID);
            //}

            

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


    protected void btnNewBill_Click(object sender, EventArgs e)
    {
        //Create new bill and get new PK first...
        SqlParameter[] NewParams = {
                                       new SqlParameter("@TID", TenantID),
                                       new SqlParameter("@EID", EmployeeID),
                                       new SqlParameter("@IF", false)
                                   };
        int NewBillPK = DataAccess.InsertAndGetIndex("INSERT INTO Bills (TenantID, EmployeeID, IsFinalized) VALUES (@TID, @EID, @IF)", NewParams, ConnString);

        Response.Redirect("GenerateBill.aspx?BID=" + NewBillPK.ToString() + "&TID=" + TenantID.ToString());


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        rebindReportViewer(DDLBillPeriod.SelectedValue);
    }

    private void rebindReportViewer(string _BillID)
    {


        RV_Bill.LocalReport.DataSources.Clear();
        ReportDataSource ds = new ReportDataSource();
        ds.Name = "DS_Bill";
        ds.DataSourceId = "SqlDS_GetBill";

        SqlDS_GetBill.SelectParameters.Clear();
        SqlDS_GetBill.SelectParameters.Add(new Parameter("BID", DbType.Int32, _BillID));
        SqlDS_GetBill.DataBind();


        RV_Bill.LocalReport.DataSources.Add(ds);
        RV_Bill.DataBind();
    }




}