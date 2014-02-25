<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ContractMgt.aspx.cs" Inherits="Admin_ContractMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Tenant Contract Information Management</h1>

    <p>Select a Tenant:
        <asp:DropDownList ID="ddlSelectTenant" runat="server" 
            AppendDataBoundItems="True" DataSourceID="SqlDS_Tenants" 
            DataTextField="SUMMARY" DataValueField="TenantID">
            <asp:ListItem Value="">--Select a Tenant--</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDS_Tenants" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT TenantID, LName + ', ' + FName + ' ' + MName + ' - ' + CASE Gender WHEN 1 THEN 'Male' ELSE 'Female' END + '(' + CONVERT (NVARCHAR(10), TenantID) + ')' AS 'SUMMARY' FROM Tenants ORDER BY LName">
        </asp:SqlDataSource>
         <asp:Button ID="btnAddContract" runat="server" PostBackUrl="~/Admin/Contract.aspx" Text="Add a Contract" />
    </p>
    <p>
        <asp:ListView ID="ListView_Contracts" runat="server" DataKeyNames="ContractID" 
            DataSourceID="SqlDS_Contracts">
           
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No Contracts Issued Yet.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>

            <ItemTemplate>
            <%--<a href='<%# "ViewContract.aspx?ID=" + Eval("ContractID").ToString() %>'>--%>
                <tr style="background-color: #FFFBD6;color: #333333;">
                    <a href='<%# "ViewContract.aspx?ID=" + Eval("ContractID").ToString() %>'>
                    <td>
                        <a href='<%# "ViewContract.aspx?ID=" + Eval("ContractID").ToString() %>'><asp:Label ID="ContractIDLabel" runat="server" Text='<%# Eval("ContractID") %>' /></a>
                    </td>
                    <td>
                        <asp:Label ID="LNameLabel" runat="server" Text='<%# "(" + Eval("TenantID").ToString() + ") " +Eval("LName").ToString() + ", " + Eval("FName").ToString() + " " + Eval("MName").ToString() %>' />
                    </td>
                    <td>
                        <asp:Label ID="GenderLabel" runat="server" Text='<%# GetGender(int.Parse(Eval("Gender").ToString())) %>' />
                    </td>
                    <td>
                        <asp:Label ID="RoomNoLabel" runat="server" Text='<%# Eval("RoomNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UnitTypeNameLabel" runat="server" 
                            Text='<%# Eval("UnitTypeName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BedSideLabel" runat="server" Text='<%# GetBedSide(int.Parse(Eval("BedSide").ToString())) %>' />
                    </td>
                    <td>
                        <asp:Label ID="UNLabel" runat="server" Text='<%# Eval("UN") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StartDateLabel" runat="server" Text='<%# DateTime.Parse(Eval("StartDate").ToString()).ToShortDateString() + "-" + DateTime.Parse(Eval("EndDate").ToString()).ToShortDateString() %>' />
                    </td>
                    <td>
                        <asp:Label ID="PeriodLabel" runat="server" Text='<%# Eval("Period") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsValidCheckBox" runat="server" 
                            Checked='<%# Eval("IsValid") %>' Enabled="false" />
                    </td>
                    </a>
                </tr>
                <%--</a>--%>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;" width="300">
                                <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                    <th runat="server">
                                        ContractID</th>
                                    <th runat="server">
                                        Name</th>  
                                    <th runat="server">
                                        Gender</th>
                                    <th runat="server">
                                        Room No.</th>
                                    <th runat="server">
                                        Unit Type</th>
                                    <th runat="server">
                                        Bed Side</th>
                                    <th runat="server">
                                        Issued By</th>
                                    <th runat="server">
                                        Contract Duration</th>
                                    <th runat="server">
                                        Contract Terms</th>
                                    <th runat="server">
                                        Is Valid</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
           
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDS_Contracts" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT Contracts.ContractID, Contracts.TenantID, Tenants.LName, Tenants.FName, Tenants.MName, Tenants.Gender, Rooms.RoomNo, UnitType.UnitTypeName, BedSpaces.BedSide, Employees.UN, Contracts.StartDate, Contracts.EndDate, Contracts.Period, Contracts.IsValid FROM UnitType INNER JOIN Rooms ON UnitType.UnitTypeID = Rooms.UnitTypeID INNER JOIN BedSpaces ON Rooms.RoomID = BedSpaces.RoomID INNER JOIN Contracts INNER JOIN Tenants ON Contracts.TenantID = Tenants.TenantID INNER JOIN Employees ON Contracts.EmployeeID = Employees.EmployeeID ON BedSpaces.BedSpaceID = Contracts.BedSpaceID">
        </asp:SqlDataSource>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

