<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Splash_Screen.aspx.cs" Inherits="Splash_Screen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
<link href="SpashScreenCss.css" rel="stylesheet" />    
    <title>
        
        Welcome to movie baazar
    </title>
    </head>
<body id="PageBody" runat="server">
      <form id="form1" runat="server">
          <div class="maindiv">

              <asp:Label ID="Label1" runat="server" Text="Welcome to Movie Baazar" CssClass="labelcss" Font-Bold="true" ForeColor="White" Font-Size="80px"></asp:Label>
                 <br />           
                <div class="div1">
                 <asp:ImageMap ID="ImageMap1" runat="server"  Height="720px" ImageAlign="AbsMiddle" ImageUrl="~/spgif.gif" Width="100%" AlternateText="Error" CssClass="image1">
              </asp:ImageMap>          
          </div>
               </div>

      </form>
        </body>
</html>
 