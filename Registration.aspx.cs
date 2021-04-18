
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string insertUpdateData(string fname, string lname, string username, string password, string email, string contact, string dob, string address, string usertype, string isActive)
    {
        Props obj = new Props();


        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        //var temp = demo;
        conn.Open();

        obj.firstName = fname;
        obj.lastName = lname;
        obj.password = password;
        obj.email = email;
        obj.contact = contact;
        obj.dob = dob;
        obj.address = address;
        obj.userType = usertype;
        obj.isActive = isActive;
        obj.createAt = Convert.ToString(DateTime.Today);
        obj.createBy = "admin";
        obj.updateAt = "";
        obj.updateBy = "";

        string query = "insert into user_master values('"+obj.userName+"','"+password+"','"+obj.userType+"','"+obj.firstName+"','"+obj.lastName+"','"+obj.email+"','"+obj.dob+"','"+obj.address+"','"+obj.createAt+"','"+obj.createBy+"','"+obj.updateAt+"','"+obj.updateBy+"','"+obj.isActive+"','"+obj.contact+"')";
        SqlCommand com = new SqlCommand(query,conn);
        com.ExecuteNonQuery();
        conn.Close();
        return "1";
    }
}