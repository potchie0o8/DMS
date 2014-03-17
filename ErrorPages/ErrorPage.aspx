<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/ErrorPages/ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<html>
<head>
    <style type="text/css">
        .style2
        {
            width: 271px;
            height: 272px;
        }
    </style>
</head>
<body bgcolor="#368BC1">
<form runat="server">
<h1>Sorry, an error has occurred! - EGI DMS Home Page</h1>

    

    <p>
        <center><img alt="Sad Face" class="style2" longdesc="kidmondo_face_sad" 
            src="kidmondo_face_sad.gif" /><br />
            <br />
            <asp:LinkButton ID="lnkBtnHome" PostBackUrl="~/Default.aspx" runat="server">Return To Home Page</asp:LinkButton>
    </center></p>

    
</form>
</body>
</html>
