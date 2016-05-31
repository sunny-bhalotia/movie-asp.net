<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Movie Baazar</title>
                <link runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
                <link runat="server" rel="icon" href="favicon.ico" type="image/ico"/>

    <link href="Signincss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="parent">

        <div class="background-image"></div>
    <div class="child">
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Username"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" CssClass="lined thick" runat="server" Text="Login" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Button ID="HyperLink1" runat="server" Text="Forgot Password?" BackColor="Transparent" OnClick="HyperLink1_Click"/>

    </div>
    </div>
    </form>
</body>
</html>
