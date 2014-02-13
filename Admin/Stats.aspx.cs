using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Configuration;
using DBHelpers;



public partial class Admin_Stats : System.Web.UI.Page
{

    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        loadGenderChart();
    }
    private void loadGenderChart()
    {
        BarChartSeries Male = new BarChartSeries();
        Male.BarColor = "#0000FF";
        Male.Name = "Male";


        BarChartSeries Female = new BarChartSeries();
        Female.BarColor = "#FF00FF";
        Female.Name = "Female";


        string strCountMale = "SELECT COUNT (*) AS 'COUNT' FROM Tenants WHERE Gender = 1";
        string strCountFemale = "SELECT COUNT (*) AS 'COUNT' FROM Tenants WHERE Gender = 2";

        int MaleCount = int.Parse(DataAccess.ReturnData(strCountMale, conString, "COUNT"));
        int FemaleCount = int.Parse(DataAccess.ReturnData(strCountFemale, conString, "COUNT"));

        Decimal[] MaleNumbers = {
                                    Convert.ToDecimal(MaleCount)
                                };
        Decimal[] FemaleNumbers = {
                                      Convert.ToDecimal(FemaleCount)
                                  };

        Male.Data = MaleNumbers;
        Female.Data = FemaleNumbers;

        BarChartSeries[] GenderCountCollection = {
                                                     Male, Female
                                                  };

        barchartGender.Series.AddRange(GenderCountCollection);
        barchartGender.DataBind();

        lblTotalTenants.Text = (FemaleCount + MaleCount).ToString();



    }

}