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
        .style4
        {
            width: 110px;
            height: 59px;
        }
        .style5
        {
            width: 168px;
            height: 59px;
        }
        .style6
        {
            height: 59px;
        }
        .style7
        {
            width: 110px;
            height: 26px;
        }
        .style8
        {
            width: 168px;
            height: 26px;
        }
        .style9
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Create Contract</h1>
<p>
    <asp:Label ID="lblAlert" runat="server" style="color: #FF0000"></asp:Label>
</p>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style7">
                    Date of Start</td>
                <td class="style8">
                    <asp:TextBox ID="txtDateStart" runat="server" Width="180px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="txtDateStart_MaskedEditExtender" runat="server" Mask="99/99/9999" MaskType="Date" TargetControlID="txtDateStart">
                    </asp:MaskedEditExtender>
                    <asp:CalendarExtender ID="txtDateStart_CalendarExtender" runat="server" 
                        TargetControlID="txtDateStart">
                    </asp:CalendarExtender>
                </td>
                <td class="style9">
                    <asp:RequiredFieldValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Select date of start!" ForeColor="Red" 
                        ValidationGroup="Contract" ControlToValidate="txtDateStart">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Period of Payment</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlPeriod" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlPeriod_SelectedIndexChanged">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem>Daily</asp:ListItem>
                        <asp:ListItem>Monthly</asp:ListItem>
                        <asp:ListItem>Annually</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RegularExpressionValidator6" runat="server" 
                        ErrorMessage="Select period of payment!" ValidationGroup="Contract" 
                        ForeColor="Red" ControlToValidate="ddlRoom">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    End Date</td>
                <td class="style8">
                    <asp:TextBox placeholder="-Select period of payment first.-" ID="txtEndDate" runat="server" Width="180px" Enabled="False"></asp:TextBox>
                    <asp:MaskedEditExtender ID="txtEndDate_MaskedEditExtender" runat="server" 
                        Mask="99/99/9999" MaskType="Date" TargetControlID="txtEndDate">
                    </asp:MaskedEditExtender>
                    <asp:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" 
                        TargetControlID="txtEndDate">
                    </asp:CalendarExtender>
                </td>
                <td class="style9">
                    <asp:RequiredFieldValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Select end of contract date!" ValidationGroup="Contract" 
                        ForeColor="Red" ControlToValidate="txtEndDate">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Select Unit Type</td>
                <td class="style5">
                    <asp:DropDownList ID="ddlUnit" runat="server" 
                        DataSourceID="SqlDS_UnitType" DataTextField="Name" 
                        DataValueField="UnitTypeID" AppendDataBoundItems="True" 
                        AutoPostBack="True" onselectedindexchanged="ddlUnit_SelectedIndexChanged">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDS_UnitType" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        SelectCommand="SELECT UnitTypeID, UnitTypeName + ' for ' + CASE WHEN Gender=1 THEN 'Male' ELSE 'Female' END AS 'Name' FROM UnitType">
                    </asp:SqlDataSource>
                </td>
                <td class="style6">
                    <asp:RequiredFieldValidator ID="RegularExpressionValidator3" runat="server" 
                        ErrorMessage="Select unit type!" ValidationGroup="Contract" 
                        ForeColor="Red" ControlToValidate="ddlUnit">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Choose Room No</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlRoom" runat="server" 
                        DataSourceID="SqlDS_Rooms" DataTextField="Name" 
                        DataValueField="RoomID" AppendDataBoundItems="True" AutoPostBack="True" 
                        onselectedindexchanged="ddlRoom_SelectedIndexChanged">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDS_Rooms" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        
                        SelectCommand="SELECT Rooms.RoomID, Rooms.RoomNo + ' ' + UnitType.UnitTypeName AS 'Name' FROM Rooms INNER JOIN UnitType ON Rooms.UnitTypeID = UnitType.UnitTypeID"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RegularExpressionValidator4" runat="server" 
                        ErrorMessage="Select a room!" ValidationGroup="Contract" ForeColor="Red" 
                        ControlToValidate="ddlRoom">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Choose Bedside</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlBedside" runat="server" 
                        DataSourceID="SqlDS_BedSide" DataTextField="Name" 
                        DataValueField="BedSpaceID" AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDS_BedSide" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        
                        SelectCommand="SELECT BedSpaces.BedSpaceID, Rooms.RoomNo + '  ' + UnitType.UnitTypeName + '  ' + CASE WHEN BedSide = 1 THEN 'Left/Top' ELSE 'Right/Bottom' END AS 'Name' FROM BedSpaces INNER JOIN Rooms ON BedSpaces.RoomID = Rooms.RoomID INNER JOIN UnitType ON Rooms.UnitTypeID = UnitType.UnitTypeID">
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RegularExpressionValidator5" runat="server" 
                        ErrorMessage="Select bedside!" ValidationGroup="Contract" ForeColor="Red" 
                        ControlToValidate="ddlBedside">*</asp:RequiredFieldValidator>
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
                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnSkip" runat="server" Text="Skip" PostBackUrl="~/Admin/ManageTenants.aspx" />
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

