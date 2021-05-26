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
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class utility : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region Admin Side
    [WebMethod]
    public static string getUser()
    {
        utility mst = new utility();
        Dictionary<string, string> row = row = new Dictionary<string, string>(); 
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
        string user;

        if (Session["username"].ToString() == "0" || Session["username"] == null)
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
            Response.Redirect("../login.aspx");
        }
        catch (Exception ex)
        {

        }
    }
    #endregion

    #region Client Side
    [WebMethod]
    public static string getClientUser()
    {
        utility mst = new utility();
        Dictionary<string, string> row = row = new Dictionary<string, string>(); ;
        List<Dictionary<string, string>> rows = new List<Dictionary<string, string>>();
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        Props obj = new Props();
        obj.userName = mst.getUserClientInSession();

      

        row.Add("clientuser", obj.userName);
        rows.Add(row);
        serializer.MaxJsonLength = Int32.MaxValue;

        string jj = serializer.Serialize(rows);
        return serializer.Serialize(rows);

    }

    private string getUserClientInSession()
    {
        string user;

        if (Session != null && Session["clientusername"] != null)
        {
            //Session != null && Session["TenantSessionId"] != null
            //Session["clientusername"] == null
            user = Session["clientusername"].ToString();
            
        }
        else
        {
            user = null;
            
        }


        return user;

    }

    [WebMethod]
    public static string setUserClientInSession(string username)
    {
        utility util = new utility();
        util.setUserInSession(username);
        return "1";

    }

    private  void setUserInSession(string username)
    {
        Session["clientusername"] = username;
    }

    [WebMethod]
    public static string signOutUserClientInSession()
    {
        utility util = new utility();
        util.signOutUserInSession();
        return "1";

    }

    private void signOutUserInSession()
    {
        Session["clientusername"] = null;
    }

    [WebMethod]
    public static string insertUserData(string username, string password)
    {
        string flag = "0";
        Dictionary<string, string> row = row = new Dictionary<string, string>();
        List<Dictionary<string, string>> rows = new List<Dictionary<string, string>>();
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        Props obj = new Props();
        obj.userName = username.Trim();
        string userExist = utility.checkUserExist(obj.userName);

        if (userExist == "1")
        {
            flag = "0";
        }
        else
        {
            SqlConnection conn = new SqlConnection();
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            //var temp = demo;
            conn.Open();



            obj.firstName = "";
            obj.lastName = "";
            obj.password = password;
            obj.email = "";
            obj.contact = "";
            //obj.dob = dob;
            obj.address = "";
            obj.userType = "";
            obj.isActive = "1";
            obj.createAt = DateTime.Now.ToString("yyyy-MM-dd");
            obj.userName = username;
            obj.createBy = "User";
            obj.updateAt = null;
            obj.updateBy = "";
            //insert into USER_MASTER values('username','pass','type','fname','lname','email','address','createAt','createby','updateAt','updateBy','isActive','contact')
            string query = "insert into USER_MASTER values('" + obj.userName + "','" + obj.password + "','" + obj.userType + "','" + obj.firstName + "','" + obj.lastName + "','" + obj.email + "','" + obj.address + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + obj.contact + "')";
            SqlCommand com = new SqlCommand(query, conn);
            com.ExecuteNonQuery();
            flag = "1";
            conn.Close();
        }

        row.Add("flag", flag);
        rows.Add(row);
        serializer.MaxJsonLength = Int32.MaxValue;

        string jj = serializer.Serialize(rows);
        return serializer.Serialize(rows);
        
    }

    
    private static string checkUserExist(string username)
    {
        Props obj = new Props();
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        string flag = "0";
        obj.userName = username.Trim();
        string quiery = "select * from user_master where usrname='"+obj.userName+"'";
        SqlCommand com = new SqlCommand(quiery,conn);

        int count = Convert.ToInt32(com.ExecuteScalar());
        if (count >= 1)
        {
             flag = "1";
        }

        conn.Close();
        return flag;
    }

    [WebMethod]
    public static string checkUserValid(string username, string password)
    {
        string flag = "0";
        Dictionary<string, string> row = row = new Dictionary<string, string>();
        List<Dictionary<string, string>> rows = new List<Dictionary<string, string>>();
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        Props obj = new Props();
        obj.userName = username.Trim();
        obj.password = password.Trim();
        string userExist = utility.checkUserValidExist(obj.userName, obj.password);

        if (userExist == "1")
        {
            flag = "0";
        }
        else
        {
            
            flag = "1";
            
        }

        row.Add("flag", flag);
        rows.Add(row);
        serializer.MaxJsonLength = Int32.MaxValue;

        string jj = serializer.Serialize(rows);
        return serializer.Serialize(rows);

    }

    private static string checkUserValidExist(string username,string password)
    {
        Props obj = new Props();
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        string flag = "0";
        obj.userName = username.Trim();
        obj.password = password.Trim();
        string quiery = "select * from user_master where usrname='" + obj.userName + "' and password='"+ obj.password + "' and isActive='1'";
        SqlCommand com = new SqlCommand(quiery, conn);

        int count = Convert.ToInt32(com.ExecuteScalar());
        if (count >= 1)
        {
            flag = "1";
        }

        conn.Close();
        return flag;
    }

    #region Send Mail
    [WebMethod]
    public static string sendMail(string name, string email,string contact,string message)
    {
        Props obj = new Props();
        obj.mailName = name.Trim();
        obj.mailEmail = email.Trim();
        obj.mailContact = contact.Trim();
        obj.mailMessage = message.Trim();
        utility.sendClientMail(obj.mailName, obj.mailEmail, obj.mailContact, obj.mailMessage);
        return "1";
    }

    private static void sendClientMail(string name, string email, string contact, string message)
    {
        string hostEmailId = "karanmrajgor010@gmail.com";
        string hostEmailPwd = "aerospace@007";
        //MailMessage tMailMessage = new MailMessage();
        //string defaultEmail = hostEmailId;
        //tMailMessage.To.Add(new MailAddress(defaultEmail));
        string tmpbody = @"
<div id='Panel2' style='background-color: #F0F0F0; text-align: center; padding-bottom: 10px; padding-top: 20px;'>
                                            <div id='Panel3' style='background-color: #F0F0F0; width: 500px; margin-left: auto; margin-right: auto; padding-bottom: 20px; padding-top: 20px;'>
                                                
                                                <div style='background-color: #424aeb; color: white; height: 60px; font-weight: bold; padding-top: 20px; font-size: 25px'>
                                                    <span style='margin-top:25px'>User's Response from Custom PC Builder </span>
                                                </div>
                                                <div style='background-color: #f0e73c; padding-top: 50px; padding-bottom: 50px; font-size: 18px; font-family: Calibri; border: 1px solid #dadada; padding-left: 0px; padding-right: 10px; text-align: justify;'>
                                                    <p style='font-size: 17px; padding-left: 10px; padding-right: 10px; font-weight: bold'>
                                                        </p>
                                                    
                                                    <div style='font-size: 17px; padding-left: 15px; padding-right: 0px; padding-bottom: 10px;'>
                                                        <p><b>Name:</b> {name} </p>
                                                        <p><b>Contact No:</b> {contact} </p>
                                                         <p><b>Email ID:</b> {email} </p>                                                         
                                                         <p><b>Message:</b> {message} </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
";

        tmpbody = tmpbody.Replace("{name}", name);
        tmpbody = tmpbody.Replace("{contact}", contact);
        tmpbody = tmpbody.Replace("{email}", email);        
        tmpbody = tmpbody.Replace("{message}", message);
        

        //tMailMessage.Subject = "Inquiry From User Custom PC Builder";

        //tMailMessage.Body = tmpbody;

        //tMailMessage.IsBodyHtml = true;

        //tMailMessage.Priority = MailPriority.Normal;

        //tMailMessage.SubjectEncoding = System.Text.Encoding.UTF8;

        //tMailMessage.BodyEncoding = System.Text.Encoding.UTF8;

        ////var filename = @"D:\ALL INDIA TRANSPORT\3702.pdf";
        ////System.Net.Mail.Attachment attachment;
        ////attachment = new System.Net.Mail.Attachment(filename);
        ////tMailMessage.Attachments.Add(attachment);


        ////SmtpClient tSmtpClient = new SmtpClient("us2.smtp.mailhostbox.com",25);
        //SmtpClient tSmtpClient = new SmtpClient();

        ////tSmtpClient.Host = "us2.smtp.mailhostbox.com";
        ////tSmtpClient.Port = 25;

        //tSmtpClient.Host = "smtp.gmail.com";
        ////  tSmtpClient.Host="email-smtp.us-west-2.amazonaws.com";
        //tSmtpClient.Port = 587;

        //tSmtpClient.EnableSsl = true;

        //tSmtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

        //tSmtpClient.UseDefaultCredentials = false;


        ////tSmtpClient.Credentials = new System.Net.NetworkCredential("info@datatechinfosoft.com", pswd);
        //tSmtpClient.Credentials = new System.Net.NetworkCredential(hostEmailId, hostEmailPwd);

        //tSmtpClient.Send(tMailMessage);
        
        MailMessage messageMail = new MailMessage(hostEmailId, hostEmailId);
        messageMail.Subject = "User Response From Custom PC Builder";
        messageMail.Body = tmpbody;
        messageMail.BodyEncoding = System.Text.Encoding.UTF8;
        messageMail.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
        System.Net.NetworkCredential basicCredential1 = new
        System.Net.NetworkCredential(hostEmailId, hostEmailPwd);
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = basicCredential1;

        try
        {
            client.Send(messageMail);
        }

        catch (Exception ex)
        {
            throw ex;
        }
    }

    #endregion

    #endregion

    #region RAM
    [WebMethod]
    public static string getRamData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select top 3 * from mst_ram where isActive=1";
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
    public static string getMoreRamData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_ram where isActive=1";
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
    #endregion

    #region Processor
    [WebMethod]
    public static string getProcessorData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select top 3 * from mst_processor where isActive=1";
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
    public static string getMoreProcessorData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_processor where isActive=1";
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
    #endregion

    #region Motherboard
    [WebMethod]
    public static string getMotherboardData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select top 3 * from mst_motherboard where isActive=1";
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
    public static string getMoreMotherboardData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_motherboard where isActive=1";
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
    #endregion

    #region GPU
    [WebMethod]
    public static string getGPUData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select top 3 * from mst_gpu where isActive=1";
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
    public static string getMoreGPUData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_gpu where isActive=1";
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
    #endregion

    #region SMPS
    [WebMethod]
    public static string getSMPSData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select top 3 * from mst_smps where isActive=1";
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
    public static string getMoreSMPSData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_smps where isActive=1";
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
    #endregion

    #region Cooler
    [WebMethod]
    public static string getCoolerData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select top 3 * from mst_cooler where isActive=1";
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
    public static string getMoreCoolerData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_cooler where isActive=1";
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
    #endregion

    #region Storage
    [WebMethod]
    public static string getStorageData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select top 3 * from mst_storage where isActive=1";
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
    public static string getMoreStorageData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_storage where isActive=1";
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
    #endregion

    #region Wifi-Card 
    [WebMethod]
    public static string getWifiCardData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select top 3 * from mst_WiFiCard where isActive=1";
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
    public static string getMoreWifiCardData()
    {
        Props obj = new Props();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        string query = "select * from mst_WiFiCard where isActive=1";
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
    #endregion

    public class ClientData
    {
       
    }
}