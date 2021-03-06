/****** Object:  StoredProcedure [dbo].[GetContract]    Script Date: 02/22/2014 13:49:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetContract]

@CID int

AS

BEGIN

SELECT Contracts.ContractID, Contracts.TenantID, Tenants.LName, Tenants.FName, Tenants.MName, Tenants.Gender, 
Rooms.RoomNo, UnitType.UnitTypeName, BedSpaces.BedSide, Employees.FName, Employees.MName, Employees.LName, Contracts.StartDate, 
Contracts.EndDate, Contracts.Period, Contracts.IsValid, UnitType.DailyRate, UnitType.MonthlyRate, UnitType.YearlyRate, Contracts.DateCreated,
Tenants.Street + ', ' + Tenants.City + ', ' + Tenants.Region + ', ' + Tenants.Country AS 'Address' 
FROM UnitType INNER JOIN Rooms 
ON UnitType.UnitTypeID = Rooms.UnitTypeID INNER JOIN BedSpaces 
ON Rooms.RoomID = BedSpaces.RoomID INNER JOIN Contracts INNER JOIN Tenants 
ON Contracts.TenantID = Tenants.TenantID INNER JOIN Employees 
ON Contracts.EmployeeID = Employees.EmployeeID ON BedSpaces.BedSpaceID = Contracts.BedSpaceID

WHERE ContractID=@CID

END
GO
