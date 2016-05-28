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
        PageBody.Attributes.Add("bgcolor", "gray");
        HtmlMeta meta = new HtmlMeta();
        meta.HttpEquiv = "Refresh";
        meta.Content = "5;url=Default2.aspx";
        this.Page.Controls.Add(meta);
        
    }

    public void changecolor()
    {
            Label1.ForeColor = System.Drawing.Color.Red;
            
    }
}