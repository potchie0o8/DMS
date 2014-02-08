<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewAnnouncement.aspx.cs" Inherits="Admin_ViewAnnouncements" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>View Announcement</h1>
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    Subject</td>
                <td class="style2">
                    <asp:TextBox ID="txtSubject" runat="server" Width="421px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please indicate Subject!" ForeColor="Red" 
                        ControlToValidate="txtMsg" ValidationGroup="AddAnnouncement">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Date Posted</td>
                <td class="style2">
                    <asp:Label ID="lblDatePosted" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Message</td>
                <td class="style2">
                    <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Columns="50" Rows="10"></asp:TextBox>

                    <asp:HtmlEditorExtender ID="HtmlEditorExtender1" 
                        TargetControlID="txtMsg" DisplaySourceTab="true" 
                        runat="server"/>
                        <Toolbar runat="server"> 
                            <asp:Undo runat="server" />
                            <asp:Redo runat="server" />
                            <asp:Bold runat="server" />
                            <asp:Italic runat="server" />
                            <asp:Underline runat="server" />
                            <asp:StrikeThrough runat="server" />
                            <asp:Subscript runat="server" />
                            <asp:Superscript runat="server" />
                            <asp:JustifyLeft runat="server" />
                            <asp:JustifyCenter runat="server" />
                            <asp:JustifyRight runat="server" />
                            <asp:JustifyFull runat="server" />
                            <asp:InsertOrderedList runat="server" />
                            <asp:InsertUnorderedList runat="server" />
                            <asp:CreateLink runat="server" />
                            <asp:UnLink runat="server" />
                            <asp:RemoveFormat runat="server" />
                            <asp:SelectAll runat="server" />
                            <asp:UnSelect runat="server" />
                            <asp:Delete runat="server" />
                            <asp:Cut runat="server" />
                            <asp:Copy runat="server" />
                            <asp:Paste runat="server" />
                            <asp:BackgroundColorSelector runat="server" />
                            <asp:ForeColorSelector runat="server" />
                            <asp:FontNameSelector runat="server" />
                            <asp:FontSizeSelector runat="server" />
                            <asp:Indent runat="server" />
                            <asp:Outdent runat="server" />
                            <asp:InsertHorizontalRule runat="server" />
                            <asp:HorizontalSeparator runat="server" />
                            <asp:InsertImage runat="server" />
                        </Toolbar>
                    </asp:HtmlEditorExtender>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please indicate Message!" ForeColor="Red" 
                        ControlToValidate="txtSubject" ValidationGroup="AddAnnouncement">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update Announcement" ValidationGroup="AddAnnouncement" />

                    &nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete Announcement" />
                    <asp:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" 
                        ConfirmText="Are you sure you want to delete this announcement?" 
                        TargetControlID="btnDelete">
                    </asp:ConfirmButtonExtender>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="txtCancel" runat="server" Text="Cancel" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

