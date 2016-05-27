<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FirstPage.aspx.cs" Inherits="FirstPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Movie Baazar</title>
                <link runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
                <link runat="server" rel="icon" href="favicon.ico" type="image/ico"/>
</head>

<body><link href="FirstPageCss.css" rel="stylesheet" />
    <form id="form1" runat="server">
    <div >
    <div  class="header">
        <asp:TextBox ID="TextBox1" runat="server" Width="305px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
         <asp:Button ID="Button1" runat="server" Text="Button" />
    
        </div>
        <div class="gridiv">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
  BorderWidth="1px" BackColor="White" CellPadding="3" BorderStyle="None" 
  BorderColor="#CCCCCC" Font-Names="Arial" Height="693px" Width="100%">

            <FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
    <PagerStyle ForeColor="#000066" HorizontalAlign="Left" 
      BackColor="White"></PagerStyle>
    <HeaderStyle ForeColor="White" Font-Bold="True" 
      BackColor="#006699"></HeaderStyle>
    <Columns>
        <asp:ImageField DataImageUrlField="Poster" ControlStyle-Width="250px" ControlStyle-Height="250px"></asp:ImageField>
        <asp:BoundField HeaderText="Title" DataField="Title" ControlStyle-Width="100px">
            <ItemStyle HorizontalAlign="Center" 
              VerticalAlign="Middle" Font-Size="25px"> </ItemStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="Languages" DataField="Language" ControlStyle-Width="250px" >
            <ItemStyle HorizontalAlign="Center" Font-Size="25px" ></ItemStyle>
        </asp:BoundField>

        <asp:BoundField HeaderText="Release Date" DataField="Released" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" Font-Size="25px"></ItemStyle>
        </asp:BoundField>
        
    </Columns>
    <SelectedRowStyle ForeColor="White" Font-Bold="True" 
       BackColor="#669999"></SelectedRowStyle>
    <RowStyle ForeColor="#000066"></RowStyle>

        </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
