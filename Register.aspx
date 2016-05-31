<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="RegisterCSS.css" rel="stylesheet" />
      <title>Movie Baazar</title>
                <link runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
                <link runat="server" rel="icon" href="favicon.ico" type="image/ico"/>

</head>

    <script type="text/javascript">
    function tSpeedValue(txt)
    {
        var pas1 = document.getElementsByName('TextBox5')[0].value;
        var pas2 = document.getElementsByName('TextBox6')[0].value;
       // alert(pas1);
        //alert(pas2);
        if (txt.value == pas1)
        {
            document.getElementById('Label2').innerHTML = '';
            document.getElementById("Label2").style.display = "none";
           // alert("hi");
        }            
        else {
            document.getElementById('Label2').innerHTML = 'Passwords do not match';

            document.getElementById("Label2").style.display = "block";
        }
        

    }
    </script>

<body>
    <form id="form1" runat="server">
        <div class="maindiv">
    <div class="childiv">
    
        <asp:TextBox ID="TextBox1" runat="server" placeholder="First Name" CssClass="rbuttons" Width="298px"></asp:TextBox>
        <br />
      <asp:TextBox ID="TextBox2" runat="server" placeholder="Last Name" CssClass="rbuttons" Width="297px"></asp:TextBox>
        <br />

        <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged" placeholder="User Name" CssClass="rbuttons" Width="297px"></asp:TextBox>
        
        <br />
        <asp:TextBox ID="TextBox4" runat="server" placeholder="Gmail Id" CssClass="rbuttons" Width="298px"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox5" runat="server" placeholder="Password" CssClass="rbuttons" TextMode="password" Width="296px"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox6" runat="server" placeholder="Password Again" CssClass="rbuttons" TextMode="password" Width="294px" onkeyup="tSpeedValue(this)"></asp:TextBox>
        <br />
        <br />
        

        <asp:Button ID="Button1" runat="server" Text="Register" CssClass="rbuttons2" Width="320px" OnClick="Button1_Click" />
        <br />
        
    </div>

            <div class="childiv1">
                 <br />
                
                  <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                  <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="" CssClass="rlabels" ></asp:Label>
                <br />
                
                  <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="" CssClass="rlabels"></asp:Label>
           
                
            </div>
      </div>
    </form>
</body>
</html>
