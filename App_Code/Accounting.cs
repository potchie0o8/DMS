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

        /// <summary>
        /// Reminders:
        /// tenants with annual contract pay 4 months advance.
        /// </summary>


        public static string ConnString = StaticVariables.ConnectionString;

        public static double GetBalance(int _TenantID)
        {
            int count = 0;

            double UnpaidBalance = 0;
            string strGetBal = "SELECT TotalAmount FROM Bills WHERE ((IsPaid=0 OR IsPaid IS NULL) AND (IsFinalized=1)) AND (TenantID=@TID)";
            SqlParameter[] TID = { new SqlParameter("@TID", _TenantID) };
            SqlDataReader dr = DataAccess.ReturnReader(strGetBal, TID, ConnString);

            while (dr.Read())
            {
                double TotalBalPerBill = Convert.ToDouble(dr["TotalAmount"].ToString());
                UnpaidBalance = UnpaidBalance + TotalBalPerBill;
                count = count + 1;
            }
            DataAccess.ForceConnectionToClose();

            if (count == 1)
            {
                return UnpaidBalance;
            }
            else if (count > 1)
            {
                string strTopBal = "SELECT Top 1 TotalAmount FROM Bills WHERE ((IsPaid=0 OR IsPaid IS NULL) AND (IsFinalized=1)) AND (TenantID=@TID) ORDER BY DateGenerated DESC";
                SqlParameter[] TID1 = { new SqlParameter("@TID", _TenantID) };
                double TopBal = Convert.ToDouble(DataAccess.ReturnData(strTopBal, TID1, ConnString, "TotalAmount"));
                return TopBal;
            }
            else
            {
                return 0;
            }
        }
	}
}