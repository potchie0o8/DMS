using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBHelpers;
using Globals;

public partial class Admin_ViewContract : System.Web.UI.Page
{
    string connstring = StaticVariables.ConnectionString;
    int ContractID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ContractID = int.Parse(Request.QueryString["ID"]);
        }
        catch
        {
            Response.Redirect("ContractMgt.aspx");
        }
    }
    protected void btnVoidContract_Click(object sender, EventArgs e)
    {
        try
        {
            DataAccess.DataProcessExecuteNonQuery("UPDATE Contracts SET IsValid=0 WHERE ContractID='" + ContractID.ToString() + "'", connstring);
            Response.Redirect("ContractMgt.aspx");
        }
        catch
        { }
    }
}