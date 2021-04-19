
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
    public static string insertUpdateData(string mode, string fname, string lname, string username, string password, string email, string contact, string address, string usertype, string isActive, string id)
    {
        Props obj = new Props();


        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        //var temp = demo;
        conn.Open();

        if (mode == "insert")
        {
            obj.firstName = fname;
            obj.lastName = lname;
            obj.password = password;
            obj.email = email;
            obj.contact = contact;
            //obj.dob = dob;
            obj.address = address;
            obj.userType = usertype;
            obj.isActive = isActive;
            obj.createAt = DateTime.Now.ToString("yyyy-MM-dd");
            obj.userName = username;
            obj.createBy = "admin";
            obj.updateAt = null;
            obj.updateBy = "";
            //insert into USER_MASTER values('username','pass','type','fname','lname','email','address','createAt','createby','updateAt','updateBy','isActive','contact')
            string query = "insert into USER_MASTER values('" + obj.userName + "','" + obj.password + "','" + obj.userType + "','" + obj.firstName + "','" + obj.lastName + "','" + obj.email + "','" + obj.address + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + obj.contact + "')";
            SqlCommand com = new SqlCommand(query, conn);
            com.ExecuteNonQuery();

        }
        else
        {
            //update USER_MASTER set usrname = '',password = '',type = '',fname = '',lname = '',email = '',address = '',createAt = '',createBy = '',updateAt = '',updateBy = '',isActive = '',contact = '' where user_id = ''
            
            obj.firstName = fname;
            obj.lastName = lname;
            obj.password = password;
            obj.email = email;
            obj.contact = contact;
            //obj.dob = dob;
            obj.address = address;
            obj.userType = usertype;
            obj.isActive = isActive;
            obj.id = id;
            obj.userName = username;
            
            obj.updateAt = DateTime.Now.ToString("yyyy-MM-dd"); ;
            obj.updateBy = "admin";
            string query = "update USER_MASTER set usrname = '"+obj.userName+"',password = '"+obj.password+"',type = '"+obj.userType+"',fname = '"+obj.firstName+"',lname = '"+obj.lastName+"',email = '"+obj.email+"',address = '"+obj.address+"',updateAt = '"+obj.updateAt+"',updateBy = '"+obj.updateBy+"',isActive = '"+obj.isActive+"',contact = '"+obj.contact+"' where user_id = '"+obj.id+"'";
            SqlCommand com = new SqlCommand(query,conn);
            com.ExecuteNonQuery();


        }


        conn.Close();
        return "1";
    }

    [WebMethod]
    public static string getData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from user_master";
        SqlDataAdapter adp = new SqlDataAdapter(query, conn);
        adp.Fill(ds);
        dt = ds.Tables[0];
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;

        foreach (DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }

        serializer.MaxJsonLength = Int32.MaxValue;

        string jj = serializer.Serialize(rows);
        return serializer.Serialize(rows);


    }

    public static string getUserData(string id)
    {
        Props obj = new Props();
        obj.id = id;
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        //var temp = demo;
        //conn.Open();
        string query = "select * from user_master where user_id='" + obj.id + "'";
        SqlDataAdapter adp = new SqlDataAdapter(query, conn);
        adp.Fill(ds);
        dt = ds.Tables[0];

        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;

        foreach (DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }

        serializer.MaxJsonLength = Int32.MaxValue;

        string jj = serializer.Serialize(rows);
        return serializer.Serialize(rows);

        //conn.Close();
    }

    public static string deleteUser(string id)
    {
        Props obj = new Props();
        obj.id = id;
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        obj.id = id;
        string query = "";

        return "1";
    }

}