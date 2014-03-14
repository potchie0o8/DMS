using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using DBHelpers;
using Globals;
using CustomStrings;

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


        public static int GenerateNewBill(int _TenantID, int _EmployeeID)
        {
            SqlParameter[] Params = { 
                                        new SqlParameter("@TenantID", _TenantID),
                                        new SqlParameter("@EmployeeID", _EmployeeID)
                                    };
             return DataAccess.InsertAndGetIndex("INSERT INTO Bills (TenantID, DateGenerated, EmployeeID, IsPaid, IsFinalized) VALUES (@TenantID, getDate(), @EmployeeID, 0, 0)", Params, ConnString); 
        }


        public static void InsertBillItem(int _BIllID, string _Particular, double _Amount)
        {
            SqlParameter[] Params = { 
                                        new SqlParameter("@BillID", _BIllID),
                                        new SqlParameter("@Particular", _Particular),
                                        new SqlParameter("@Amount", _Amount)
                                    };
            DataAccess.DataProcessExecuteNonQuery("INSERT INTO Bill_Items (BillID, Particular, Amount) VALUES (@BillID, @Particular, @Amount)", Params, ConnString);
        }

        public static void TotalAndFinalizeBill(int _BillID)
        {
            double TotalAmt = 0;
            SqlParameter[] BID = { new SqlParameter("@BID", _BillID) };
            string strSelectBillItems = "SELECT * FROM Bill_Items WHERE BillID=@BID";

            SqlDataReader dr = DataAccess.ReturnReader(strSelectBillItems, BID, ConnString);

            while (dr.Read())
            {
                TotalAmt = TotalAmt + Convert.ToDouble(dr["Amount"].ToString());
            }

            DataAccess.ForceConnectionToClose();

            SqlParameter[] UpdateParams = {
                                              new SqlParameter("@BID", _BillID),
                                              new SqlParameter("@TotalAmt", TotalAmt)
                                          };

            DataAccess.DataProcessExecuteNonQuery("UPDATE Bills SET TotalAmount=@TotalAmt, IsFinalized=1 WHERE BillID=@BID", UpdateParams, ConnString);
        }

        public static int MarkBillAsPaid(int _BillID, string _Remarks)
        {
            //Select totalamount of bill
            SqlParameter[] BID = { new SqlParameter("@BID", _BillID) };
            string strGetTotalAmt = "SELECT TotalAmt FROM Bills WHERE BillID=@BID";
            double TotalAmt = Convert.ToDouble(DataAccess.ReturnData(strGetTotalAmt, BID, ConnString, "TotalAmt")); 
            
            //Insert New Reciept with total amount and remarks
            SqlParameter[] InsertRParams = { 
                                               new SqlParameter("@AMT", TotalAmt),
                                               new SqlParameter("@RMKS", AntiXSSMethods.CleanString(_Remarks))
                                           };
            int NewReceiptID = DataAccess.InsertAndGetIndex("INSERT INTO Receipts (Amount, Remarks) VALUES (@AMT, @RMKS)", InsertRParams, ConnString);
            
            //Update Bill as Paid
            SqlParameter[] ReceiptParams = { new SqlParameter("@RID", NewReceiptID) };
            DataAccess.DataProcessExecuteNonQuery("UPDATE Bills SET IsPaid=1, ReceiptID=@RID", ReceiptParams, ConnString);
            
            //return new reciept ID
            return NewReceiptID;
        }


        


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