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
 

        public static void UpdateAuditTrail(string _Action, int _UserID)
        {
            //string strInsert = "INSERT INTO tb_AuditTrail (UserID, Action) VALUES (@UserID, @Action)";
            //SqlParameter[] InsertParams = {
            //                                   new SqlParameter("@UserID", _UserID),
            //                                   new SqlParameter("@Action", _Action)
            //                               };
            //DataAccess.DataProcessExecuteNonQuery(strInsert, InsertParams, ConnString);
        }

    }
}