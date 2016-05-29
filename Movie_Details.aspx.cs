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
using System.Data;

public partial class Movie_Details : System.Web.UI.Page
{
    String conString = "";
    String id = "";
    String moviename = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        conString = WebConfigurationManager.ConnectionStrings["Pubs"].ConnectionString;

        if (Session["moviename"]!=null)
        moviename=(Session["moviename"].ToString());
        Label2.Text = moviename;

        String query = "select rated,runtime,awards,plot,poster,id from movie_db where title='"+moviename+"'";
        SqlConnection con = new SqlConnection(conString);

        SqlDataReader reader;
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            // Define the ADO.NET objects.
            con.Open();
            reader = cmd.ExecuteReader();
            reader.Read();
            Label4.Text = reader["rated"].ToString();
            Label6.Text = reader["runtime"].ToString();
            Label8.Text = reader["awards"].ToString();
            Label10.Text = reader["plot"].ToString();
            Image1.ImageUrl = reader["poster"].ToString();
            id = reader["id"].ToString();
            reader.Close();
        }
        catch (Exception err)
        {
            Label2.Text = "Error getting the details. ";
            Label2.Text += err.Message;
            Label2.Text += err.StackTrace;
        }
        finally
        {
            con.Close();
        }
        query = "select * from opinion where id='" + id + "'";
        DataTable table = new DataTable();
        using (SqlCommand cmd1 = new SqlCommand(query, con))

        {

            using (SqlDataAdapter ad = new SqlDataAdapter(cmd1))

            {

                con.Open();

                ad.Fill(table);

                con.Close();
            }
        }
    
    GridView1.DataSource = table;

        GridView1.DataBind();


        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        if (Session["userName"]==null)
        {
           
            string message = "Please Sign in to give your opinion"+p;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
        else
        {
            string message = "Thank you for your valuable opinion.";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());



            String insert_Query = "insert into opinion values(@us,@fi,@la,@gm)";
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand(insert_Query, con);
            cmd.Parameters.AddWithValue("@us", Session["userName"].ToString());
            cmd.Parameters.AddWithValue("@fi", id);
            cmd.Parameters.AddWithValue("@la", ' ');
            cmd.Parameters.AddWithValue("@gm", Request.Form["TextArea1"].ToString(););
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                if (err.ToString().Contains("PRIMARY")) { }
                else { }

            }
            finally
            {
                con.Close();
            }


        }
    }
}