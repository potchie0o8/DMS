<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="RoomMgt.aspx.cs" Inherits="Admin_RoomMgt" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            height: 26px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Room Management</h1>
    <div><h2>Unit Types</h2>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="UnitTypeName" HeaderText="Unit Type" 
                        SortExpression="UnitTypeName" />
                    <asp:BoundField DataField="DailyRate" HeaderText="Daily Rate" 
                        SortExpression="DailyRate" DataFormatString="{0:n}" />
                    <asp:BoundField DataField="MonthlyRate" HeaderText="Monthly Rate" 
                        SortExpression="MonthlyRate" DataFormatString="{0:n}" />
                    <asp:BoundField DataField="YearlyRate" HeaderText="Yearly Rate" 
                        SortExpression="YearlyRate" DataFormatString="{0:n}" />
                    <%--<asp:BoundField DataField="Gender" HeaderText="Gender" 
                        SortExpression="Gender" />--%>
                    <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                    <%# getGender(int.Parse(Eval("Gender").ToString())) %>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                SelectCommand="SELECT [UnitTypeName], [DailyRate], [MonthlyRate], [YearlyRate], [Gender] FROM [UnitType]">
            </asp:SqlDataSource>
        </p>
    </div>
    <div>
    <hr />
    <h2>Rooms</h2>
        <p>
            <%# getGender(int.Parse(Eval("Gender").ToString())) %>
                <asp:Button ID="btnAddRoom" runat="server" Text="Add New Room" />
                <asp:ModalPopupExtender ID="ModalPopupExtenderAddRoom" CancelControlID="btnCancelAddRoom" PopupControlID="PanelAddRoom" TargetControlID="btnAddRoom" runat="server">
                </asp:ModalPopupExtender>
        </p>
        
        <asp:Panel ID="PanelAddRoom" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Dotted">
         <h1>Add New Room</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Room No.</td>
                <td class="style2">
                    <asp:TextBox ID="txtRoomNo" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="style2">
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    Select Unit Type</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlUnitType" runat="server" DataSourceID="SqlDataSource4" 
                        DataTextField="Name" DataValueField="UnitTypeID" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        
                        SelectCommand="SELECT UnitTypeID, UnitTypeName + ' for ' + CASE WHEN Gender=1 THEN 'Male' ELSE 'Female' END AS 'Name' FROM UnitType">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                        Text="Submit" />
                    &nbsp;<asp:Button ID="btnCancelAddRoom" runat="server" Text="Cancel" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
        </asp:Panel>


        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="RoomNo" HeaderText="Room No" 
                        SortExpression="RoomNo" />
                    <asp:BoundField DataField="UnitTypeName" HeaderText="Unit Type" 
                        SortExpression="UnitTypeName" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                SelectCommand="SELECT Rooms.RoomNo, UnitType.UnitTypeName FROM Rooms INNER JOIN UnitType ON Rooms.UnitTypeID = UnitType.UnitTypeID">
            </asp:SqlDataSource>
        </p>
    </div>
    <div>
    <hr />
    <h2>Bedspaces</h2>
        <p>
            <%--<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="Add Bedspace" />--%>
                <asp:Button ID="btnAddBedSpace" Text="Add Bedspace" runat="server" />
            <asp:ModalPopupExtender ID="ModalPopupExtenderAddBedSpace" TargetControlID="btnAddBedSpace" CancelControlID="btnCancel" PopupControlID="PanelAddBedSpace" runat="server">
            </asp:ModalPopupExtender>
        </p>
        <p>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="RoomNo" HeaderText="Room No" 
                        SortExpression="RoomNo" />
                    <asp:TemplateField HeaderText="Bed Side">
                    <ItemTemplate>
                    <%# getBedside(int.Parse(Eval("BedSide").ToString())) %>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                SelectCommand="SELECT Rooms.RoomNo, BedSpaces.BedSide FROM Rooms INNER JOIN BedSpaces ON Rooms.RoomID = BedSpaces.RoomID">
            </asp:SqlDataSource>
        </p>

        <asp:Panel ID="PanelAddBedSpace" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Dotted">
        <h1>Add Bedspace</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Select Room No.</td>
                <td>
                    <asp:DropDownList ID="ddlRoomNo" runat="server" 
                        DataSourceID="SqlDataSource5" DataTextField="RoomNo" DataValueField="RoomID" 
                        style="margin-bottom: 0px" AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        SelectCommand="SELECT [RoomID], [RoomNo], [UnitTypeID] FROM [Rooms]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Select Side</td>
                <td>
                    <asp:DropDownList ID="ddlSide" runat="server">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem Value="1">Left</asp:ListItem>
                        <asp:ListItem Value="2">Right</asp:ListItem>
                        <asp:ListItem Value="1">Top</asp:ListItem>
                        <asp:ListItem Value="2">Bottom</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button2" runat="server" onclick="btnSubmitBedSpace_Click" 
                        Text="Submit" />
                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                </td>
            </tr>
        </table>
    </p>
        </asp:Panel>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

