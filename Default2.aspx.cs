using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    String conString = "";
    String username = "", fname = "", lname = "";
    String p = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.GridLines = GridLines.None;

        if (Session["userName"] != null)
        {
            username = (Session["userName"].ToString());
            signinbutton.Visible = false;
            signupbutton.Visible = false;
        }
        else
        {
            Button2.Visible = false;
        }
        if (Session["firstname"] != null)
            fname = (Session["firstname"].ToString());
        if (Session["lastname"] != null)
            lname = (Session["lastname"].ToString());
        Label1.Text = " " + fname + " " + lname;
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {


    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        Response.Redirect("SignIn.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        p = DropDownList1.SelectedItem.Text;
        Session["selectedtext"] = p;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {


        //Response.Redirect("Register.aspx");
        conString = WebConfigurationManager.ConnectionStrings["Pubs"].ConnectionString;
        DataTable table = new DataTable();
        if (Session["selectedtext"] != null)
            p = Session["selectedtext"].ToString();
        else
            p = "COUNTRY";
        //  Response.Write(p);
        using (SqlConnection conn = new SqlConnection(conString))

        {

            string sql = "";
            if (p.Equals("RATING"))
                sql = "SELECT title ,rating,poster,released,id FROM movie_db where RATING > '" + TextBox1.Text.ToString() + "' order by rating desc";
            else
        if (p.Equals("RELEASED"))
                sql = "select title,rating,poster,released,id from movie_db where DATEPART(yyyy,released)='" + TextBox1.Text.ToString() + "' order by rating desc";
            else
                sql = "SELECT title ,rating,poster,released,id FROM movie_db where " + p + " like '%" + TextBox1.Text.ToString() + "%' order by released desc";
            //Response.Write(sql);
            using (SqlCommand cmd = new SqlCommand(sql, conn))

            {

                using (SqlDataAdapter ad = new SqlDataAdapter(cmd))

                {

                    conn.Open();

                    ad.Fill(table);

                    conn.Close();
                }
            }
        }
        GridView1.DataSource = table;

        GridView1.DataBind();
    }

   

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        // CommandArgument property.
        int index = Convert.ToInt32(e.CommandArgument);

        // Retrieve the row that contains the button 
        // from the Rows collection.
        GridViewRow row = GridView1.Rows[index];
        String n = row.Cells[1].Text.ToString();
        Session["moviename"] = n;
        Server.Transfer("Movie_Details.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["userName"] = null;
        Server.Transfer("Default2.aspx");
       
    }
}

