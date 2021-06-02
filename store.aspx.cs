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

public partial class store : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string getAllProducts()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_products where isActive=1";
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
    [WebMethod]
    public static string getMouse()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_products where isActive=1 and type='Mouse'";
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
    [WebMethod]
    public static string getMonitor()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_products where isActive=1 and type='Monitors'";
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
    [WebMethod]
    public static string getKeyboard()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_products where isActive=1 and type='Keyboards'";
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
    [WebMethod]
    public static string getHeadset()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_products where isActive=1 and type ='Headsets'";
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
    public static string getWiFiCard()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_products where isActive=1 and type = 'Wifi-Card'";
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
}