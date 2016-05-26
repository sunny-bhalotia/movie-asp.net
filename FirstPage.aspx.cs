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

public partial class FirstPage : System.Web.UI.Page
{

    String conString = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.GridLines = GridLines.None;
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {


        //Response.Redirect("Register.aspx");
        conString = WebConfigurationManager.ConnectionStrings["Pubs"].ConnectionString;
        DataTable table = new DataTable();

        using (SqlConnection conn = new SqlConnection(conString))

        {

            string sql = "SELECT title ,language,poster,released FROM movie_db where title like '%"+TextBox1.Text.ToString()+"%' order by released desc";

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
}
