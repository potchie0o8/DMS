<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="AddMessage.aspx.cs" Inherits="Admin_AddMessage" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 105px;
        }
    .style3
    {
        width: 414px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Create Message</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Select Tenant</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlTenant" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="TenantName" DataValueField="TenantID" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        SelectCommand="SELECT TenantID, LName + ', ' + FName + '  ' + MName AS 'TenantName' FROM Tenants ORDER BY 'TenantName'">
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="ddlTenant" ErrorMessage="Please Select a Tenant!" 
                        ForeColor="Red" ValidationGroup="Message"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Subject</td>
                <td class="style3">
                    <asp:TextBox ID="txtSubject" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtSubject" ErrorMessage="Please enter subject!" 
                        ForeColor="Red" ValidationGroup="Message"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Message</td>
                <td class="style3">
                   <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Columns="50" Rows="10"></asp:TextBox>

                    <asp:HtmlEditorExtender ID="HtmlEditorExtender1" 
                        TargetControlID="txtMsg" DisplaySourceTab="true" 
                        runat="server"/>
                        <Toolbar> 
                            <asp:Undo />
                            <asp:Redo />
                            <asp:Bold />
                            <asp:Italic />
                            <asp:Underline />
                            <asp:StrikeThrough />
                            <asp:Subscript />
                            <asp:Superscript />
                            <asp:JustifyLeft />
                            <asp:JustifyCenter />
                            <asp:JustifyRight />
                            <asp:JustifyFull />
                            <asp:InsertOrderedList />
                            <asp:InsertUnorderedList />
                            <asp:CreateLink />
                            <asp:UnLink />
                            <asp:RemoveFormat />
                            <asp:SelectAll />
                            <asp:UnSelect />
                            <asp:Delete />
                            <asp:Cut />
                            <asp:Copy />
                            <asp:Paste />
                            <asp:BackgroundColorSelector />
                            <asp:ForeColorSelector />
                            <asp:FontNameSelector />
                            <asp:FontSizeSelector />
                            <asp:Indent />
                            <asp:Outdent />
                            <asp:InsertHorizontalRule />
                            <asp:HorizontalSeparator />
                            <asp:InsertImage />
                        </Toolbar>
                    </asp:HtmlEditorExtender>
                        </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please indicate Message!" ForeColor="Red" 
                        ControlToValidate="txtMsg" ValidationGroup="Message"></asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Send" onclick="Button1_Click" 
                        ValidationGroup="Message" />
                &nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Admin/MessageMgt.aspx" />
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

