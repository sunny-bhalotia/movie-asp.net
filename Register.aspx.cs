using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;

public partial class Register : System.Web.UI.Page
{
    String conString = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        conString=WebConfigurationManager.ConnectionStrings["Pubs"].ConnectionString;
    }

    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        String insert_Query = "insert into person values(@us,@fi,@la,@gm,@pa,' ',0,' ')";
        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand(insert_Query, con);
        cmd.Parameters.AddWithValue("@us", TextBox3.Text.ToString());
        cmd.Parameters.AddWithValue("@fi", TextBox1.Text.ToString());
        cmd.Parameters.AddWithValue("@la", TextBox2.Text.ToString());
        cmd.Parameters.AddWithValue("@gm", TextBox4.Text.ToString());
        cmd.Parameters.AddWithValue("@pa", TextBox5.Text.ToString());
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception err)
        {
            if (err.ToString().Contains("PRIMARY")) {

                string message = "Username exists";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

            }
            else { }
            
        }
        finally
        {
            con.Close();
        }
    }

    protected void TextBox6_TextChanged(object sender, EventArgs e)
    {
        Response.Write("writing");
        if (TextBox6.Text.ToString().Equals(TextBox5.Text.ToString()))
        {
            Label2.Visible = false;
            Response.Write("same");
        }
        else {
            Label2.Visible = true;
            Response.Write("not same");
        }
            
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Response.Write("writing");
    }
}