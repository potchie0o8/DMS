using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Basta dito lahat ng mga global variables
/// </summary>
namespace Globals
{
    public static class StaticVariables
    {
        public static string ConnectionString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    }

    public static class IntToWords
    {
        public static string getGender(int _genderID)
        {
            string gender = "";
            switch (_genderID)
            {
                case 1:
                    gender = "Male";
                    break;
                case 2:
                    gender = "Female";
                    break;
            }
            return gender;
        }


        public static string getAdminAccess(int _AccessLevel)
        {
            string AccessLevel = "";
            switch (_AccessLevel)
            {
                case 1:
                    AccessLevel = "<font color='green'>Full</font>";
                    break;
                case 2:
                    AccessLevel = "<font color='red'>Limited</font>";
                    break;
            }
            return AccessLevel;
        }

    }

}