using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DevSamples_DateTimeComparison : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //para kunin mo yung current datetime
        DateTime Now = DateTime.Now;
        //DateTime Now = Convert.ToDateTime("3/7/2014 10:59:00 PM");
        DateTime Curfew;

        string curfewTime = "23:00";

        //Datetime Object Sample = 3/7/2014 12:00:00 AM
 

        //converts curfew time and current date today to 1 datetime object
        string strDateTimeCurfew = DateTime.Now.ToShortDateString() + " " + curfewTime;

        

        //convert string to datetime
        Curfew = Convert.ToDateTime(strDateTimeCurfew);


        //Response.Write(Curfew.ToString());


        //compares the datettime objects
        if (Now >= Curfew)
        {
            Response.Write("Lampas. Lagot ka.");
            //dapat maginsert na sa violations
        }
        else
        {
            Response.Write("Sige lang.");
        }

    }
}