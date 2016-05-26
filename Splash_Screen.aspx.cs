using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Threading;

using System.Collections;
public partial class Splash_Screen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PageBody.Attributes.Add("bgcolor", "black");
        HtmlMeta meta = new HtmlMeta();
        meta.HttpEquiv = "Refresh";
        meta.Content = "5;url=FirstPage.aspx";
        this.Page.Controls.Add(meta);
        
        ThreadStart childref1 = new ThreadStart(changecolor);
        Console.WriteLine("In Main: Creating the Child thread");
        Thread childThread1 = new Thread(childref1);
        childThread1.Start();
    }

    public void changecolor()
    {
            Label1.ForeColor = System.Drawing.Color.Red;
            
    }
}