<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="Announcement.aspx.cs" Inherits="Admin_Announcement" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Add an Announcement</h1>
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
                    Message</td>
                <td class="style2">
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
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" ValidationGroup="AddAnnouncement" />
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