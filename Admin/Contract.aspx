<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="Contract.aspx.cs" Inherits="Admin_Contract" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 110px;
        }
        .style3
        {
            width: 168px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Contract</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Date of Start</td>
                <td class="style3">
                    <asp:TextBox ID="txtDateStart" runat="server" Width="180px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="txtDateStart_MaskedEditExtender" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtDateStart">
                    </asp:MaskedEditExtender>
                    <asp:CalendarExtender ID="txtDateStart_CalendarExtender" runat="server" 
                        TargetControlID="txtDateStart">
                    </asp:CalendarExtender>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Select date of start!" ForeColor="Red" ValidationGroup="Contract">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    End Date</td>
                <td class="style3">
                    <asp:TextBox ID="txtEndDate" runat="server" Width="180px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="txtEndDate_MaskedEditExtender" runat="server" 
                        Mask="99/99/9999" MaskType="Date" TargetControlID="txtEndDate">
                    </asp:MaskedEditExtender>
                    <asp:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" 
                        TargetControlID="txtEndDate">
                    </asp:CalendarExtender>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Select end of contract date!" ValidationGroup="Contract" 
                        ForeColor="Red">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Select Unit Type</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlUnit" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="Name" 
                        DataValueField="UnitTypeID" AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        SelectCommand="SELECT UnitTypeID, UnitTypeName + ' for ' + CASE WHEN Gender=1 THEN 'Male' ELSE 'Female' END AS 'Name' FROM UnitType">
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ErrorMessage="Select unit type!" ValidationGroup="Contract" 
                        ForeColor="Red">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Choose Room No</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlRoom" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="RoomNo" 
                        DataValueField="RoomID" AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        
                        SelectCommand="SELECT Rooms.RoomID, Rooms.RoomNo + ' ' + UnitType.UnitTypeName AS 'Name' FROM Rooms INNER JOIN UnitType ON Rooms.UnitTypeID = UnitType.UnitTypeID"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ErrorMessage="Select a room!" ValidationGroup="Contract" ForeColor="Red">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Choose Bedside</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlBedside" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="Name" 
                        DataValueField="BedSpaceID" AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        
                        SelectCommand="SELECT BedSpaces.BedSpaceID, Rooms.RoomNo + '  ' + UnitType.UnitTypeName + '  ' + CASE WHEN BedSide = 1 THEN 'Left/Top' ELSE 'Right/Bottom' END AS 'Name' FROM BedSpaces INNER JOIN Rooms ON BedSpaces.RoomID = Rooms.RoomID INNER JOIN UnitType ON Rooms.UnitTypeID = UnitType.UnitTypeID WHERE (BedSpaces.ContractID IS NULL)">
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ErrorMessage="Select bedside!" ValidationGroup="Contract" ForeColor="Red">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Period of Payment</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlPeriod" runat="server">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem>Daily</asp:ListItem>
                        <asp:ListItem>Monthly</asp:ListItem>
                        <asp:ListItem>Semi Annually</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ErrorMessage="Select period of payment!" ValidationGroup="Contract" 
                        ForeColor="Red">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                        HeaderText="Contract cannot be completed! Please Check ff errors below:" 
                        ValidationGroup="Contract" />
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" ValidationGroup="Contract" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

