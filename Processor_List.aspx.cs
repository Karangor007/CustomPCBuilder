﻿using System;
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

public partial class Processor_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindRptList();
        }
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Session["processor_id"] = "0";
        Response.Redirect("processor_Master.aspx");
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
            Session["processor_id"] = id;
            Response.Redirect("processor_Master.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
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
            string query = "delete from mst_processor where id = '" + id + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            //bindRptList();
            Response.Redirect("processor_list.aspx");
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

            string query = "select * from mst_processor";
            SqlDataAdapter adp = new SqlDataAdapter(query, conn);
            adp.Fill(ds);
            rptProcessor.DataSource = ds;
            rptProcessor.DataBind();

            conn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
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