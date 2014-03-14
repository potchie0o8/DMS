using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using DBHelpers;
using System.Data.SqlClient;
using Globals;

/// <summary>
/// Updates Audit Trail, My Friends
/// </summary>
namespace Auditor
{
    public static class AuditTrailFunctions
    {
        private static string ConnString = StaticVariables.ConnectionString;
 
        //ganito siya pag gagamitin
        //AuditTrailFunctions.UpdateAuditTrail("Updated UserID No. 117", EmployeeID, 1);

        public static void UpdateTenantAuditTrail(string _Action, int _TenantID)
        {
            string strInsert = "INSERT INTO AuditTrail (TenantID, Action) VALUES (@tid, @action)";
            SqlParameter[] InsertParams = {
                                               new SqlParameter("@tid", _TenantID),
                                               new SqlParameter("@action", _Action),
                                           };
            DataAccess.DataProcessExecuteNonQuery(strInsert, InsertParams, ConnString);
        }

        public static void UpdateEmployeeAuditTrail(string _Action, int _EmployeeID)
        {
            string strInsert = "INSERT INTO AuditTrail (EmployeeID, Action) VALUES (@eid, @action)";
            SqlParameter[] InsertParams = {
                                               new SqlParameter("@eid", _EmployeeID),
                                               new SqlParameter("@action", _Action),
                                           };
            DataAccess.DataProcessExecuteNonQuery(strInsert, InsertParams, ConnString);
        }

    }
}