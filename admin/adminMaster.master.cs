
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

public partial class admin_adminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string getUser()
    {
        admin_adminMaster mst = new admin_adminMaster();
        Dictionary<string, string> row = row = new Dictionary<string, string>(); ;
        List<Dictionary<string, string>> rows = new List<Dictionary<string, string>>();
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        Props obj = new Props();
        obj.userName = mst.getUserInSession();

        if (obj.userName == "" || obj.userName == null)
        {
            mst.redirectLogin();
        }
        else
        {
            
            row.Add("user", obj.userName);
            rows.Add(row);
        }


        serializer.MaxJsonLength = Int32.MaxValue;

        string jj = serializer.Serialize(rows);
        return serializer.Serialize(rows);

    }

    private string getUserInSession()
    {
        string user = "";
        if (Session["username"].ToString() == "0")
        {
            Response.Redirect("../login.aspx");
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
