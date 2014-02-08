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
}