<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Movie_Details.aspx.cs" Inherits="Movie_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="MoiveDetails.css" rel="stylesheet" />
      <title>Movie Baazar</title>
                <link runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
                <link runat="server" rel="icon" href="favicon.ico" type="image/ico"/>


     <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="rating.js"></script>
    <link rel="stylesheet" type="text/css" href="rating.css" />
    <script type="text/javascript">
        $(function ()
        {
            $('.rating').rating();

            $('.ratingEvent').rating({ rateEnd: function (v) { $('#result').text(v);  } });
        });
    </script>
</head>

<body>
    <form id="form1" runat="server">
    <div class="imagebody">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/pp.jpg"  OffsetX="8" OffsetY="8" />
            </div>

        <div class="maindiv">

            <asp:Label ID="Label1"  runat="server" Text="Title" CssClass="labeltext"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Label" CssClass="detailstext" Width="500px"></asp:Label>
            <br /><br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Rated" CssClass="labeltext"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Label ID="Label4" runat="server" Text="Label" CssClass="detailstext" Width="500px"></asp:Label>
            <br />
            <br />
            <br /><br />
            <asp:Label ID="Label5"  runat="server" Text="Runtime" CssClass="labeltext"></asp:Label>&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server" Text="Label" CssClass="detailstext" Width="500px"></asp:Label>
            <br />
            <br /><br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Awards" CssClass="labeltext"></asp:Label>&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Label ID="Label8" runat="server" Text="Label" CssClass="detailstext" Width="500px"></asp:Label>
            <br /><br />
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Plot" CssClass="labeltext"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<br />  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Label ID="Label10" runat="server" Text="Label" CssClass="detailstext" Width="550px" Height="200px"></asp:Label>
            <br />
            <br />
            <br />

            
               </div>
       
        <div class="gridiv1">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
  BorderWidth="1px" BackColor="White" CellPadding="3" BorderStyle="None" 
  BorderColor="#CCCCCC" Font-Names="Arial" >

            <FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
    <PagerStyle ForeColor="#000066" HorizontalAlign="Left" 
      BackColor="White"></PagerStyle>
    <HeaderStyle ForeColor="White" Font-Bold="True" 
      BackColor="#006699"></HeaderStyle>
    <Columns>
            <asp:BoundField HeaderText="Username" DataField="username" ControlStyle-Width="50px">
            <ItemStyle HorizontalAlign="Center" 
              VerticalAlign="Middle" Font-Size="16px"> </ItemStyle>
        </asp:BoundField>
        <asp:BoundField HeaderText="Movie ID" DataField="id" ControlStyle-Width="100px" ControlStyle-Height="20px" >
            <ItemStyle HorizontalAlign="Center" Font-Size="16px" ></ItemStyle>
        </asp:BoundField>

        <asp:BoundField HeaderText="Rating" DataField="rating">
            <ItemStyle HorizontalAlign="Center" Font-Size="16px"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField HeaderText="Review" DataField="review" ControlStyle-Width="250px">
            <ItemStyle HorizontalAlign="Center" Font-Size="16px"></ItemStyle>
        </asp:BoundField>
        
    </Columns>
    <SelectedRowStyle ForeColor="White" Font-Bold="True" 
       BackColor="#669999"></SelectedRowStyle>
    <RowStyle ForeColor="#000066"></RowStyle>

        </asp:GridView>
            <br />
            <div class="stardiv"><textarea id="TextArea1" name="TextArea1" cols="25" rows="4"></textarea>
           
    <input type="text" class="rating rating10" id="startext"/>
                </div>
            
    <br />
            <br />

            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />

            <asp:Label ID="Label11" runat="server" name = "Label11" ></asp:Label>

            <asp:Panel id="MovingContent" runat="server"
     style="position:absolute;font-weight:bold;font-size:20px;left:-100px;top:20px;height:40px;width:500px;">
Your opinion is invaluable to us.
</asp:Panel>

<script type="text/javascript">

//Initial position 
//(should be the same as the position specified in the element's style)
posX = -100;
posY = 65;

//Position where the element will stop
targetX=750;
targetY=65;

function move(){
 if(posX < targetX){
  posX += 10;
  if(posY < targetY) posY += 1;
  var divElement = document.getElementById('<%=MovingContent.ClientID%>');
  divElement.style.left = posX + 'px';
  divElement.style.top = posY + 'px';

  //Time in milliseconds to when to move next step
  self.setTimeout('move()', 100);  

 }
}

move(); //Start the moving

</script>
     </div>
         
    </form>
</body>
</html>
