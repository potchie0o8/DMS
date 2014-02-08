<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="Stats.aspx.cs" Inherits="Admin_Stats" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Dormitory Statistics</h1>
<br />
<h2>Male to Female Tenants Ratio</h2>
<asp:BarChart ID="barchartGender" runat="server" 
ChartHeight="300" ChartWidth="300" ChartType="Column"
ChartTitle="Male to Female Tenants Ratio" 
CategoriesAxis="2014"  
ChartTitleColor="#0E426C" CategoryAxisLineColor="#D08AD9" 
ValueAxisLineColor="#D08AD9" BaseLineColor="#A156AB" >
<Series>
    <%--<asp:BarChartSeries Name="United States" BarColor="#6C1E83" 
    Data="110, 189, 255, 95, 107, 140" />
    <asp:BarChartSeries Name="Europe" BarColor="#D08AD9" 
    Data="49, 77, 95, 68, 70, 79" />--%>
</Series>
</asp:BarChart>
    <strong>Total no. of Tenants:</strong>
    <asp:Label ID="lblTotalTenants" runat="server" Text=""></asp:Label>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

