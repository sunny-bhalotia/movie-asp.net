using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Movie_Details : System.Web.UI.Page
{
    String moviename = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["moviename"]!=null)
        moviename=(Session["moviename"].ToString());
        Label3.Text = moviename;
    }
}