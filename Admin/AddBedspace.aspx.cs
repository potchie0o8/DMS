﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using DBHelpers;
using Auditor;

public partial class Admin_AddBedspace : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["CONNSTRING"].ToString();
    int EmployeeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployeeID = int.Parse(Session["EmployeeID"].ToString());
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO BedSpaces (RoomID, BedSide) VALUES (@roomID, @side)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@roomID", ddlRoomNo.SelectedValue),
                                         new SqlParameter("@side", ddlSide.SelectedValue)
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        AuditTrailFunctions.UpdateEmployeeAuditTrail("Added new Bedspace", EmployeeID);
        Response.Redirect("~/Admin/RoomMgt.aspx");
    }
}