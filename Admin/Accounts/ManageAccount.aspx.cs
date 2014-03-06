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
    


    //

    protected void btnNewBill_Click(object sender, EventArgs e)
    {
        //Create new bill and get new PK first...
        SqlParameter[] NewParams = {
                                       new SqlParameter("@TID", TenantID),
                                       new SqlParameter("@IF", false)
                                   };
        int NewBillPK = DataAccess.InsertAndGetIndex("INSERT INTO Bills (TenantID, IsFinalized) VALUES (@TID, @IF)", NewParams, ConnString);

        Response.Redirect("GenerateBill.aspx?BID=" + NewBillPK.ToString() + "&TID=" + TenantID.ToString());


    }
}