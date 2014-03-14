using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Globals;
using DBHelpers;
using System.Data.SqlClient;
using Accounting;


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
        return "Php " + AcctFunctions.GetBalance(_TenantID).ToString(); 
    }


}