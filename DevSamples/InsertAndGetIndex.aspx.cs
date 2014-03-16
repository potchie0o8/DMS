using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBHelpers;
using Globals;
using System.Data.SqlClient;
using CustomStrings;

public partial class DevSamples_InsertAndGetIndex : System.Web.UI.Page
{

    string ConnString = StaticVariables.ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        string username = "juandelacruz";
        string CurfewTime;
        bool HasCurfew;


        string strGetCurfew = "SELECT CurfewTime FROM Tenants WHERE UN=@UN";

        SqlParameter[] UNParam = { new SqlParameter("@UN", AntiXSSMethods.CleanString(username)) };

        try
        {
            CurfewTime = DataAccess.ReturnData(strGetCurfew, UNParam, ConnString, "CurfewTime");
            DateTime Curfew = Convert.ToDateTime(DateTime.Now.ToShortDateString() + " " + CurfewTime);
            //Response.Write(Curfew);
            HasCurfew = true;

        }
        catch(Exception ex)
        {
            //Response.Write(ex.Message);
            HasCurfew = false;
        }




        if (HasCurfew == true)
        {
            //kaw bahala... may curfew si tenant
        }
        else
        {
            //walang curfew si tenant
        }



    }
}