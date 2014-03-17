using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBHelpers;
using System.Data.SqlClient;
using Globals;

/// <summary>
/// Summary description for RoomManager
/// </summary>
namespace RoomManager
{
    public static class RoomManagement
    {

        public static string ConnString = StaticVariables.ConnectionString;

        //checks if room is full
        public static bool CheckIfFull(int _RoomID)
        {
            //Get total no. of bedspaces per room
            string strCountRooms1 = "SELECT COUNT (*) AS 'Count' FROM BedSpaces WHERE RoomID=@RID";
            SqlParameter[] CheckParams1 = { new SqlParameter("@RID", _RoomID) };
            int TotalBedSpacesInRoom = int.Parse(DataAccess.ReturnData(strCountRooms1, CheckParams1, ConnString, "Count"));
            
            
            //Get Total of occupied bedspaces from room. check 
            string strCountRooms2 = "SELECT COUNT(*) AS 'Count' FROM Contracts INNER JOIN BedSpaces ON Contracts.BedSpaceID = BedSpaces.BedSpaceID INNER JOIN Rooms ON BedSpaces.RoomID = Rooms.RoomID WHERE (BedSpaces.RoomID = @RID AND Contracts.IsValid=1)";
            SqlParameter[] CheckParams2 = { new SqlParameter("@RID", _RoomID) };
            int TotalBedSpacesOccupied = int.Parse(DataAccess.ReturnData(strCountRooms2, CheckParams2, ConnString, "Count"));


            if (TotalBedSpacesOccupied >= TotalBedSpacesInRoom)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool CheckIfOccupied(int _BedSpaceID)
        {
            SqlParameter[] CheckParams = { new SqlParameter("@BID", _BedSpaceID) };
            string strCheck = "SELECT COUNT (*) AS 'Count' FROM Contracts WHERE BedSpaceID=@BID AND IsValid=1";

            int Count = int.Parse(DataAccess.ReturnData(strCheck, CheckParams, ConnString, "Count"));

            if (Count != 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        

    }




}