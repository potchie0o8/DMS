using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using DBHelpers;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Updates Audit Trail, My Friends
/// </summary>
namespace Auditor
{
    public static class AuditTrailFunctions
    {
        private static string ConnString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
 
        //ganito siya pag gagamitin
        //AuditTrailFunctions.UpdateAuditTrail("Updated UserID No. 117", EmployeeID, 1);

        public static void UpdateAuditTrail(string _Action, int _UserID, int _UserType)
        {
            //string UserType;

            //if (_UserType == 1)
            //{
            //    UserType = "Employee";
            //}
            //else if (_UserType == 2)
            //{
            //    UserType = "Tenant";
            //}
            //else if (_UserType == 3)
            //{
            //    UserType = "Guardian";
            //}

            //string strInsert = "INSERT INTO tb_AuditTrail (UserID, Action, UserType) VALUES (@UserID, @Action, @UserType)";
            //SqlParameter[] InsertParams = {
            //                                   new SqlParameter("@UserID", _UserID),
            //                                   new SqlParameter("@Action", _Action),
            //                                   new SqlParameter("@UserType", UserType)
            //                               };
            //DataAccess.DataProcessExecuteNonQuery(strInsert, InsertParams, ConnString);
        }

    }
}