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
using CustomStrings;

/// <summary>
/// Usermanagement
/// </summary>
namespace UserManagement
{
    public static class General
    {

    }

    public static class Employees
    {
        private static string ConnString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
        public static int CheckUser(string _UN, string _PWD)
        {
            string strUsername = AntiXSSMethods.CleanString(_UN);
            try
            {
                string strCheck = "SELECT Pwd FROM Employees WHERE UN=@UN";
                SqlParameter[] CheckParams = {
                                             new SqlParameter("@UN", strUsername),
                                         };
                string PasswordToCompare = DataAccess.ReturnData(strCheck, CheckParams, ConnString, "Pwd");

                if (PasswordToCompare ==  Encryption.MD5(AntiXSSMethods.CleanString(_PWD)))
                {
                    string strGetID = "SELECT EmployeeID FROM Employees WHERE UN=@UN";
                    SqlParameter[] GetIDParams = {
                                             new SqlParameter("@UN", strUsername),
                                         };
                    return int.Parse(DataAccess.ReturnData(strGetID, GetIDParams, ConnString, "EmployeeID"));
                }
                else
                {
                    return 0;
                }
            }
            catch
            {
                return 0;
            }
        }

        public static int GetAccessLevel(int _EmployeeID)
        {
            string strGetLevel = "SELECT AdminLevel FROM Employees WHERE EmployeeID=@EID";
            SqlParameter[] GetIDLevel = {
                                             new SqlParameter("@EID", _EmployeeID),
                                         };
            return int.Parse(DataAccess.ReturnData(strGetLevel, GetIDLevel, ConnString, "AdminLevel"));
        }

        public static string ReturnUserName(int _EmployeeID)
        {
            string strGetUN = "SELECT UN FROM Employees WHERE EmployeeID=@EID";
            SqlParameter[] GetUNParams = {
                                             new SqlParameter("@EID", _EmployeeID),
                                         };
            return DataAccess.ReturnData(strGetUN, GetUNParams, ConnString, "UN");
        }


    }
    public static class Tenants 
    {

    }
    public static class Guardians
    {

    }
}