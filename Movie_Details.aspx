<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Movie_Details.aspx.cs" Inherits="Movie_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="MoiveDetails.css" rel="stylesheet" />
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
    <div class="header">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>

        <div class="mainbody">

            <div class="imagebody">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/rolling.gif" />
            </div>

            <div class="detailsbody">        
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>        
            </div>

            <div class="detailsbody2">

            </div>        

        </div>

        <div class="footer">
            <div class="ftitle">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
