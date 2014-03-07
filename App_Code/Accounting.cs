using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using DBHelpers;
using Globals;

/// <summary>
/// Summary description for Accounting
/// </summary>
namespace Accounting
{
	public static class AcctFunctions
	{

        public static string ConnString = StaticVariables.ConnectionString;

        public static double GetBalance(int _TenantID)
        {
            double UnpaidBalance = 0;
            string strGetBal = "SELECT TotalAmount FROM Bills WHERE ((IsPaid=0 OR IsPaid IS NULL) AND (IsFinalized=1)) AND (TenantID=@TID)";
            SqlParameter[] TID = { new SqlParameter("@TID", _TenantID) };
            SqlDataReader dr = DataAccess.ReturnReader(strGetBal, TID, ConnString);

            while (dr.Read())
            {
                double TotalBalPerBill = Convert.ToDouble(dr["TotalAmount"].ToString());
                UnpaidBalance = UnpaidBalance + TotalBalPerBill;
            }

            DataAccess.ForceConnectionToClose();
            return UnpaidBalance;
        }
	}
}