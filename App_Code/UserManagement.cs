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
using CustomStrings;
using Globals;
//modified this class to use BCRYPT instead of MD5
using BCryptEncryption;


/// <summary>
/// Changelog:
/// 2-13-2014: changed from MD5 to BCRYPT. To update all passwords to '12345' in BCRYPT,
/// this SQL command will do. First change Pwd length in DB from 40 to 60 characters then
/// Just change the table name of the query below accdg. to Employees, Tenants and Guardians
/// UPDATE Employees SET Pwd='$2a$10$pGr0pdnzM2Cr2C519Vp2weifyEGKx1v8FLCWS.bT0UtMfFBXBqVOS'
/// 3-12-2014 = Included GetKey For each row to get password, shortened some methods...
/// </summary>
namespace UserManagement
{
    public static class General
    {

        private static string ConnString = StaticVariables.ConnectionString;

        //checks if user is existing in three tables
        public static bool CheckIfExisting(string _input)
        {

            string input = AntiXSSMethods.CleanString(_input);
            SqlParameter[] checkUNParam1 = {
                                          new SqlParameter("@un", input)
                                      };
            SqlParameter[] checkUNParam2 = {
                                          new SqlParameter("@un", input)
                                      };
            SqlParameter[] checkUNParam3 = {
                                          new SqlParameter("@un", input)
                                      };


            bool isEmployee = DataAccess.DetermineIfExisting("SELECT * FROM Employees WHERE UN=@un", checkUNParam1, ConnString);
            bool isTenant = DataAccess.DetermineIfExisting("SELECT * FROM Tenants WHERE UN=@un", checkUNParam2, ConnString);
            bool isGuardian = DataAccess.DetermineIfExisting("SELECT * FROM Guardians WHERE UN=@un", checkUNParam3, ConnString);

            if (isEmployee == false && isTenant == false && isGuardian == false)
            {
                return false;
            }
            else
            {
                return true;
            }


        }


        public static int CheckRole(string _input)
        {
            string input = AntiXSSMethods.CleanString(_input);
            SqlParameter[] checkUNParam1 = {
                                          new SqlParameter("@un", input)
                                      };
            SqlParameter[] checkUNParam2 = {
                                          new SqlParameter("@un", input)
                                      };
            SqlParameter[] checkUNParam3 = {
                                          new SqlParameter("@un", input)
                                      };

            bool isEmployee = DataAccess.DetermineIfExisting("SELECT * FROM Employees WHERE UN=@un", checkUNParam1, ConnString);
            bool isTenant = DataAccess.DetermineIfExisting("SELECT * FROM Tenants WHERE UN=@un", checkUNParam2, ConnString);
            bool isGuardian = DataAccess.DetermineIfExisting("SELECT * FROM Guardians WHERE UN=@un", checkUNParam3, ConnString);

            if (isEmployee == true)
            {
                return 1;
            }
            else if (isGuardian == true)
            {
                return 3;
            }
            else if (isTenant == true)
            {
                return 2;
            }
            else
            {
                return 4;
            }

        }


    }

    public static class Employees
    {
        private static string ConnString = StaticVariables.ConnectionString;


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

                if (BCrypt.CheckPassword(AntiXSSMethods.CleanString(_PWD), PasswordToCompare))
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

        public static string GetKey(int _EmployeeID)
        {
            string strCheck = "SELECT Pwd FROM Employees WHERE EmployeeID=@EID";
            SqlParameter[] CheckParams = {
                                             new SqlParameter("@EID", _EmployeeID),
                                         };
            string Password = DataAccess.ReturnData(strCheck, CheckParams, ConnString, "Pwd");
            return Password;
        }


    }
    public static class Tenants 
    {

        private static string ConnString = StaticVariables.ConnectionString;
        private static object _TenantID;

        public static int CheckUser(string _UN, string _PWD)
        {
            string strUsername = AntiXSSMethods.CleanString(_UN);
            try
            {
                string strCheck = "SELECT Pwd FROM Tenants WHERE UN=@UN";
                SqlParameter[] CheckParams = {
                                             new SqlParameter("@UN", strUsername),
                                         };
                string PasswordToCompare = DataAccess.ReturnData(strCheck, CheckParams, ConnString, "Pwd");

                //if (PasswordToCompare == Encryption.MD5(AntiXSSMethods.CleanString(_PWD)))  -- This used MD5, code below uses BCRYPT NOWs
                if (BCrypt.CheckPassword(AntiXSSMethods.CleanString(_PWD), PasswordToCompare))
                {
                    string strGetID = "SELECT TenantID FROM Tenants WHERE UN=@UN";
                    SqlParameter[] GetIDParams = {
                                             new SqlParameter("@UN", strUsername),
                                         };
                    return int.Parse(DataAccess.ReturnData(strGetID, GetIDParams, ConnString, "TenantID"));
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

        public static int GetTenantGender(int _TenantID)
        {
            string strGetGender = "SELECT Gender FROM Tenants WHERE TenantID=@EID";
            SqlParameter[] GetGenderParams = {
                                             new SqlParameter("@EID", _TenantID),
                                         };
            return int.Parse(DataAccess.ReturnData(strGetGender, GetGenderParams, ConnString, "Gender"));
        }

        public static string ReturnUserName(int _TenantID)
        {
            string strGetUN = "SELECT UN FROM Tenants WHERE TenantID=@EID";
            SqlParameter[] GetUNParams = {
                                             new SqlParameter("@EID", _TenantID),
                                         };
            return DataAccess.ReturnData(strGetUN, GetUNParams, ConnString, "UN");
        }

        public static string ReturnFullName(int _TenantID)
        {

            string strGetFullName = "SELECT FName + ' ' + MName + ' ' + LName AS 'FullName' FROM Tenants WHERE TenantID=@TID";

            SqlParameter[] GetFullNameParams = {
                                             new SqlParameter("@TID", _TenantID),
                                         };

            return DataAccess.ReturnData(strGetFullName, GetFullNameParams, ConnString, "FullName");
        }

        public static string GetKey(int _TenantID)
        {
            string strCheck = "SELECT Pwd FROM Tenants WHERE TenantID=@TID";
            SqlParameter[] CheckParams = {
                                             new SqlParameter("@TID", _TenantID),
                                         };
            string Password = DataAccess.ReturnData(strCheck, CheckParams, ConnString, "Pwd");
            return Password;
        }


    }
    public static class Guardians
    {
        private static string ConnString = StaticVariables.ConnectionString;

        public static int CheckUser(string _UN, string _PWD)
        {
            string strUsername = AntiXSSMethods.CleanString(_UN);
            try
            {
                string strCheck = "SELECT Pwd FROM Guardians WHERE UN=@UN";
                SqlParameter[] CheckParams = {
                                             new SqlParameter("@UN", strUsername),
                                         };
                string PasswordToCompare = DataAccess.ReturnData(strCheck, CheckParams, ConnString, "Pwd");

                //if (PasswordToCompare == Encryption.MD5(AntiXSSMethods.CleanString(_PWD)))  -- This used MD5, code below uses BCRYPT NOWs
                if (BCrypt.CheckPassword(AntiXSSMethods.CleanString(_PWD), PasswordToCompare))
                {
                    string strGetID = "SELECT Guardians FROM Tenants WHERE UN=@UN";
                    SqlParameter[] GetIDParams = {
                                             new SqlParameter("@UN", strUsername),
                                         };
                    return int.Parse(DataAccess.ReturnData(strGetID, GetIDParams, ConnString, "GuardianID"));
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

        public static string ReturnUserName(int _GuardianID)
        {
            string strGetUN = "SELECT UN FROM Guardians WHERE TenantID=@EID";
            SqlParameter[] GetUNParams = {
                                             new SqlParameter("@EID", _GuardianID),
                                         };
            return DataAccess.ReturnData(strGetUN, GetUNParams, ConnString, "UN");
        }

        public static string GetKey(int _GuardianID)
        {
            string strCheck = "SELECT Pwd FROM Guardians WHERE Guardian=@GID";
            SqlParameter[] CheckParams = {
                                             new SqlParameter("@GID", _GuardianID),
                                         };
            string Password = DataAccess.ReturnData(strCheck, CheckParams, ConnString, "Pwd");
            return Password;
        }
    }
}