
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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //protected void btnLogin_Click(object sender, EventArgs e)
    //{
    //    ClientScript.RegisterClientScriptBlock(GetType(), "sas", "<script> Swal.fire('It Worked!', '', 'success')</script>", true);
    //}

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //ClientScript.RegisterClientScriptBlock(GetType(), "sas", "<script> alert('Worked');</script>", true);
        //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "anything", "demo()", true);
        //lblWarning.Text = "Username Or Password Is Incorrect";
        Props obj = new Props();
        obj.userName = txtUser.Text.Trim();
        obj.password = txtPassword.Text.Trim();
        obj.userType = "admin";

        if (obj.userName == "" || obj.password == "")
        {
            lblWarning.Text = "Please Enter Username and Password";
            txtUser.Focus();
        }
        else
        {
            bool check = checkLogin(obj.userName, obj.password, obj.userType);

            if (check)
            {
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                lblWarning.Text = "Username Or Password Is Incorrect";
                txtPassword.Text = "";
                txtUser.Text = "";
            }
        }
        


    }

    private bool checkLogin(string username,string password,string type)
    {
        bool flag;
        int count;
        Props obj = new Props();
        obj.userName = username;
        obj.password = password;
        obj.userType = type;
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        
        string query = "select * from user_master where usrname='"+obj.userName+"' and password='"+obj.password+"' and type='"+obj.userType+"' and isactive='1'";
        SqlCommand com = new SqlCommand(query,conn);
        com.ExecuteNonQuery();
        count = Convert.ToInt32(com.ExecuteScalar());

        if (count > 0)
        {
            flag = true;
        }
        else
        {
            flag = false;
        }

        if (conn.State == ConnectionState.Open)
        {
            conn.Close();
        }

        return flag;
    }
}