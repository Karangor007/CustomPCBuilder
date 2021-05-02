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

public partial class Platform_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindRptList();
        }
    }

    protected string imgUrl(object ul)
    {
        try
        {
            string url = @"../assets/images/" + ul;
            return url;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnUpdateRepeater_Command(object sender, CommandEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Session["platform_id"] = id;
            Response.Redirect("platform_Master.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private string getUserInSession()
    {
        string user;

        if (Session["username"] == null || Session["username"].ToString() == "")
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

    protected void btnDeleteRepeater_Command(object sender, CommandEventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        //DataSet ds = new DataSet();
        int id = Convert.ToInt32(e.CommandArgument);
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        try
        {
            string query = "delete from mst_platform where pt_id = '" + id + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            //bindRptList();
            Response.Redirect("platform_list.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        try
        {
            Session["platform_id"] = "0";
            Response.Redirect("platform_master.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void bindRptList()
    {
        SqlConnection conn = new SqlConnection();
        DataSet ds = new DataSet();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            string query = "select * from mst_platform";
            SqlDataAdapter adp = new SqlDataAdapter(query, conn);
            adp.Fill(ds);
            rptPlatform.DataSource = ds;
            rptPlatform.DataBind();

            conn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}