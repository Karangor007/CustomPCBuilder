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

public partial class admin_category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string getData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_product_cat";
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

    private string getUserInSession()
    {
        string user;

        if (Session["username"].ToString() == null || Session["username"].ToString() == "")
        {
            user = null;
            redirectLogin();
        }
        else
        {
            user = Session["username"].ToString();
        }


        return user;

    }

    [WebMethod]
    public static string insertUpdateData(string mode, string name, string isActive, string id)
    {
        Props obj = new Props();

        admin_category reg = new admin_category();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        //var temp = demo;
        conn.Open();

        if (mode == "insert")
        {
            obj.prod_cat_id = id.Trim();
            obj.prod_cat_name = name.Trim();
            obj.isActive = isActive;
            obj.createAt = DateTime.Now.ToString("yyyy-MM-dd");
    
            obj.createBy = reg.getUserInSession();
            obj.updateAt = null;
            obj.updateBy = "";
            //insert into USER_MASTER values('username','pass','type','fname','lname','email','address','createAt','createby','updateAt','updateBy','isActive','contact')
            string query = "insert into mst_product_cat values('"+obj.prod_cat_name+ "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";
            SqlCommand com = new SqlCommand(query, conn);
            com.ExecuteNonQuery();

        }
        else
        {
            //update USER_MASTER set usrname = '',password = '',type = '',fname = '',lname = '',email = '',address = '',createAt = '',createBy = '',updateAt = '',updateBy = '',isActive = '',contact = '' where user_id = ''

            obj.prod_cat_id = id;
            obj.prod_cat_name = name.Trim();
            obj.isActive = isActive;
            
            obj.updateAt = DateTime.Now.ToString("yyyy-MM-dd"); ;
            obj.updateBy = reg.getUserInSession();
            string query = "update mst_product_cat set name = '" + obj.prod_cat_name + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive = '" + obj.isActive + "'  where id = '" + obj.prod_cat_id + "'";
            SqlCommand com = new SqlCommand(query, conn);
            com.ExecuteNonQuery();


        }


        conn.Close();
        return "1";
    }

    [WebMethod]
    public static string getCatData(string id)
    {
        Props obj = new Props();
        obj.id = id;
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        //var temp = demo;
        //conn.Open();
        string query = "select * from mst_product_cat where id='" + obj.id + "'";
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

    [WebMethod]
    public static string deleteCat(string id)
    {
        Props obj = new Props();
        obj.id = id;
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        conn.Open();

        obj.id = id;
        string query = "delete from mst_product_cat where id = '" + obj.id + "'";
        SqlCommand com = new SqlCommand(query, conn);
        com.ExecuteNonQuery();

        conn.Close();

        return "1";
    }

    private void redirectLogin()
    {
        try
        {
            Response.Redirect("login.aspx");
        }
        catch (Exception ex)
        {

        }
    }
}