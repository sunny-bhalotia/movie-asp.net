<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Baazar</title>
                <link runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
                <link runat="server" rel="icon" href="favicon.ico" type="image/ico"/>

    <style type="text/css">
        h1 {
            font-size:20px;
        }

        .header2cl
        {
            border-bottom:1px solid steelblue;
        }

        #TextBox1{
            width:100px;
            height:40px;
        }
        #Button1{
            width:100px;
            height:40px;
        margin-left:10px;
        background-color:forestgreen;
        color:white;
        }
        body
        {
            margin:0px;
            padding:0px;
            background-color: slateblue;
            color: #FFFFFF;
        }
        .headercl
        {
            width:100%;
            padding:5px;
            border-color:lightgreen;
            border-width:20px;
            background: red; /* For browsers that do not support gradients */
        background: -webkit-linear-gradient(red, yellow); /* For Safari 5.1 to 6.0 */
        background: -o-linear-gradient(red, yellow); /* For Opera 11.1 to 12.0 */
        background: -moz-linear-gradient(red, yellow); /* For Firefox 3.6 to 15 */
        background: linear-gradient(aliceblue, slateblue); /* Standard syntax (must be last) */
        }

        .gridiv{
    margin-top:50px;
}
        .headernew{
            margin:0px auto;
            width:45%;
        }

        .headernewmain{
            width:100%
        }

        .button1
        {
            position:absolute;
            left:1380px;
            top:3%;
        }

        .button2
        {
            position:absolute;
            left:1460px;
            top:3%;
        }


        .UCHelp
        {
            height: 150px;
            margin-top: 20px;
            font-weight: bold;
        }
        .UserControlDiv
        {
            width: 400px;
            margin: 10px;
            padding: 10px;
            border: 1px solid Gray;
            background-color: #fdd136;
               }

        #Label1{
            margin-left:20px;
            font-size:16px;
            font-family:'Open Sans';
        }
        #AdRotator1 img
        {
           
          height:620px !important;
          width:100% !important;
        
        }
        #Button2{
            position:absolute;
            left:1550px;
            top:3%;
        }

        #DropDownList1{
            margin-left:25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header2cl">
    <table id="mainBody" class="headercl">
        <tr>
            <td>
        <h1>
            Welcome to Movie Bazaar<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <asp:Button ID="Button2" runat="server" Text="Sign Out" />
                </h1>

                </td>
            <td>
                <asp:Button ID="signinbutton" runat="server" CssClass="button1" BackColor="Transparent" BorderColor="SteelBlue" BorderWidth="1px"  Text="Sign In" OnClick="Unnamed_Click1"/>
            </td>
            <td>
                <asp:Button ID="signupbutton" runat="server" CssClass="button2" BackColor="Transparent" BorderColor="SteelBlue" BorderWidth="1px" Text="Sign Up" OnClick="Unnamed_Click"/>
            </td>

            </tr>
        
        </table>
        </div>

        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="auto-style2">
            <asp:UpdatePanel ID="up1" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
                    <asp:Timer ID="Timer1" Interval="2000" runat="server" />

                                <!-- We will use AdRotator control for creating an image slider in asp.net
                                ASP AdRotator control has an AdvertisementFile which contains the information related to different
                                //images that will be displayed randomly either using the timer1 or the previous next button click
                                 -->
                                <asp:AdRotator ID="AdRotator1" AdvertisementFile="App_Data/Ads.xml" KeywordFilter="small"
                                    runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    <div>
        <div class="headernewmain" >
    <div  class="headernew">
        <asp:TextBox ID="TextBox1" runat="server" Width="305px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
         <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pubs %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('dbo.movie_db') and name<>'VOTES' and name<>'PLOT' and name<> 'AWARDS' and name<>'POSTER' and name<>'METASCORE' order by name"></asp:SqlDataSource>
    
        <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="name" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
    
        </div>
        <div class="gridiv">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
  BorderWidth="1px" BackColor="White" CellPadding="3" BorderStyle="None" 
  BorderColor="#CCCCCC" Font-Names="Arial" Height="693px" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">

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
        <asp:BoundField HeaderText="IMDB Rating" DataField="Rating" ControlStyle-Width="250px" >
            <ItemStyle HorizontalAlign="Center" Font-Size="25px" ></ItemStyle>
        </asp:BoundField>

        <asp:BoundField HeaderText="Release Date" DataField="Released" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" Font-Size="25px"></ItemStyle>
        </asp:BoundField>

        <asp:ButtonField AccessibleHeaderText="ID" DataTextField="ID">
            <ItemStyle HorizontalAlign="Center" ForeColor="ForestGreen" />
        </asp:ButtonField>
        
    </Columns>
    <SelectedRowStyle ForeColor="White" Font-Bold="True" 
       BackColor="#669999"></SelectedRowStyle>
    <RowStyle ForeColor="#000066"></RowStyle>

        </asp:GridView>
            </div>
        </div>
        </div>
    </form>
</body>
</html>


