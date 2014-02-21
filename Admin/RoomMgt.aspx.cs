﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DBHelpers;
using Globals;

public partial class Admin_RoomMgt : System.Web.UI.Page
{
    string conString = StaticVariables.ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getBedside(int _bedspaceID)
    {
        string bedspace = "";
        switch (_bedspaceID)
        {
            case 1:
                bedspace = "Left/Top";
                break;
            case 2:
                bedspace = "Right/Bottom";
                break;
        }
        return bedspace;
    }

    public string getGender(int _genderID)
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

    protected void btnAddRoom_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddRoom.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddBedspace.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO Rooms (RoomNo, UnitTypeID) VALUES (@roomNo, @unitType)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@roomNo", txtRoomNo.Text),
                                         new SqlParameter("@unitType", ddlUnitType.SelectedValue)
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        Response.Redirect("~/Admin/RoomMgt.aspx");
    }

    protected void btnSubmitBedSpace_Click(object sender, EventArgs e)
    {
        string strInsert = "INSERT INTO BedSpaces (RoomID, BedSide) VALUES (@roomID, @side)";
        SqlParameter[] insertParam = {
                                         new SqlParameter("@roomID", ddlRoomNo.SelectedValue),
                                         new SqlParameter("@side", ddlSide.SelectedValue)
                                     };
        DataAccess.DataProcessExecuteNonQuery(strInsert, insertParam, conString);
        Response.Redirect("~/Admin/RoomMgt.aspx");
    }

}