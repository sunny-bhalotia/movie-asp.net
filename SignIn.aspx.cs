using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignIn : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["Pubs"].ConnectionString;
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        SqlConnection Conn = new SqlConnection(connectionString);

        using (Conn)
        {
            SqlCommand command = new SqlCommand("get_pass2", Conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@username", TextBox1.Text.ToString());
            Conn.Open();
            SqlDataReader reader = command.ExecuteReader();

            String pass = "",fname="",lname="";
            while (reader.Read())
            {
                pass = reader.GetString(0);
                fname = reader.GetString(1);
                lname= reader.GetString(2);
            }
            reader.Close();
            Conn.Close();

            if ( pass== TextBox2.Text.ToString()) {
                //Response.Write("Authenticated");
                // Session Created
                Session["userName"] = TextBox1.Text.ToString();
                Session["firstname"] = fname;
                Session["lastname"] = lname;
               Response.Redirect("Default2.aspx");
            }            
            else
                Response.Write("Invalid Credentials");

        }
    }

    protected void HyperLink1_Click(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(connectionString);

        using (Conn)
        {
            SqlCommand command = new SqlCommand("get_pass3", Conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@username", TextBox1.Text.ToString());
            Conn.Open();
            SqlDataReader reader = command.ExecuteReader();

            String pass = "", fname = "", lname = "",gmail="";
            while (reader.Read())
            {
                pass = reader.GetString(0);
                fname = reader.GetString(1);
                lname = reader.GetString(2);
                gmail = reader.GetString(3);
            }
            reader.Close();
            Conn.Close();
            sendemail(gmail,pass,fname,lname);
        }
    }


    public void sendemail(String gmail, String pa, String fi, String la)
    {

        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

            mail.From = new MailAddress("moviebaazar10@gmail.com");
            mail.To.Add(gmail);
            mail.Subject = "Password Recovery";
            mail.Body = "Greetings from Movie Baazar , " + fi + " " + la + ". Your password is " + pa;

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("moviebaazar10", "moviebaazar12");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
            }
        catch (Exception ex)
        {
            Response.Write("failed");            
        }
    }

}