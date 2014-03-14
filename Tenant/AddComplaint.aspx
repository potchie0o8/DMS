<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/TenantMaster.master" AutoEventWireup="true" CodeFile="AddComplaint.aspx.cs" Inherits="Tenant_AddComplaint" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            height: 23px;
        }
        .style3
        {
            width: 54px;
        }
        .style4
        {
            height: 23px;
            width: 54px;
        }
        .style5
        {
            width: 182px;
        }
        .style6
        {
            height: 23px;
            width: 182px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Submit Complaints</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style3">
                    Subject</td>
                <td class="style5">
                    <asp:TextBox ID="txtSubject" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please enter subject!" ForeColor="Red" 
                        ControlToValidate="txtSubject" ValidationGroup="Complaints"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    Details</td>
                <td class="style5">
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
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please indicate details!" ForeColor="Red" 
                        ControlToValidate="txtMsg" ValidationGroup="Complaints"></asp:RequiredFieldValidator>
                        <br />
                        </Toolbar>
                    </asp:HtmlEditorExtender>
                        </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                </td>
                <td class="style6">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" ValidationGroup="Complaints" />
&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                </td>
                <td class="style2">
                </td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

