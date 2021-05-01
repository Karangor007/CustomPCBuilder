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

public partial class WiFiCard_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            requestData();
        }
    }

    private int getWiFiId()
    {
        int id;

        //if (Session["ram_id"].ToString() == "" || Session["ram_id"].ToString() == null)
        if (Session["wifi_id"] == null)
        {
            id = 0;
        }
        else
        {
            id = Convert.ToInt32(Session["wifi_id"].ToString());
        }
        return id;

    }

    private string getUserInSession()
    {
        string user;

        if (Session["username"] == null)
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

    private void clear()
    {
        txtBrand.Text = "";
        txtModel.Text = "";
        txtStock.Text = "";
        txtPrice.Text = "";
        txtSpeed.Text = "";
        txtInterface.Text = "";
        
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        try
        {

            Response.Redirect("WiFiCard_list.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Props obj = new Props();
        string path = "assets/images/";
        obj.WiFi_id = Convert.ToString(getWiFiId());
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        obj.WiFi_brand = txtBrand.Text.Trim();
        obj.WiFi_model = txtModel.Text.Trim();
        obj.WiFi_stock = txtStock.Text.Trim();
        obj.WiFi_price = txtPrice.Text.Trim();
        obj.WiFi_interface = txtInterface.Text.Trim();
        obj.WiFi_speed = txtSpeed.Text.Trim();


        // Validation
        if (obj.WiFi_brand == "" || obj.WiFi_model == "" || obj.WiFi_speed == "")
        {
            txtBrand.CssClass = "form-control border border-danger";
            txtModel.CssClass = "form-control border border-danger";
            txtSpeed.CssClass = "form-control border border-danger";

        }
        else
        {
            txtBrand.CssClass = "form-control";
            txtModel.CssClass = "form-control";
            txtSpeed.CssClass = "form-control";


            // Insert
            if (obj.WiFi_id == "0")
            {


                obj.WiFi_image = "No Image";
                obj.isActive = chbActive.Checked == true ? "1" : "0";
                obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                obj.createBy = getUserInSession();
                obj.updateAt = null;
                obj.updateBy = "";
                if (txtImage.HasFile)
                {
                    //string fname = txtImage.FileName;
                    obj.WiFi_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.WiFi_image));
                    string imgName = subGuid + obj.WiFi_image;
                    //string query = "insert into mst_ram values('" + obj.ram_brand + "','" + obj.ram_type + "','" + obj.ram_size + "','" + obj.ram_price + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + imgName + "','" + obj.isActive + "')";
                    string query = "insert into mst_wificard values('" + obj.WiFi_model + "','" + obj.WiFi_brand + "','" + obj.WiFi_speed + "','" + obj.WiFi_interface + "','" + obj.WiFi_price + "','" + obj.WiFi_stock + "','" + imgName + "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("WiFiCard_list.aspx");
                }
                else
                {
                    string query = "insert into mst_wificard values('" + obj.WiFi_model + "','" + obj.WiFi_brand + "','" + obj.WiFi_speed + "','" + obj.WiFi_interface + "','" + obj.WiFi_price + "','" + obj.WiFi_stock + "','" + obj.WiFi_image + "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("WiFiCard_list.aspx");

                }
            }
            // Update
            else
            {

                //obj.ram_img = "No Image";
                obj.isActive = chbActive.Checked == true ? "1" : "0";
                //obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                //obj.createBy = getUserInSession();
                obj.updateAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm"); ;
                obj.updateBy = getUserInSession();
                if (txtImage.HasFile)
                {
                    //string fname = txtImage.FileName;
                    obj.WiFi_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.WiFi_image));
                    string imgName = subGuid + obj.WiFi_image;
                    string query = "update mst_wificard set brand = '" + obj.WiFi_brand + "' ,image='" + imgName + "',model='" + obj.WiFi_model + "',speed='" + obj.WiFi_speed + "',interface='" + obj.WiFi_interface + "',price='" + obj.WiFi_price + "',in_stock='" + obj.WiFi_stock + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where id = '" + obj.WiFi_id + "'";
                    //update mst_ram set brand = '', type = '', size = '', price = '', updateAt = '', updateBy = '', isActive = '', img = '', in_stock = '' where ram_id = ''
                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("WiFiCard_list.aspx");
                }
                else
                {
                    string query = "update mst_wificard set brand = '" + obj.WiFi_brand + "' ,model='" + obj.WiFi_model + "',speed='" + obj.WiFi_speed + "',interface='" + obj.WiFi_interface + "',price='" + obj.WiFi_price + "',in_stock='" + obj.WiFi_stock + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where id = '" + obj.WiFi_id + "'";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("WiFiCard_list.aspx");

                }
            }

        }

    }

    private void requestData()
    {
        SqlConnection conn = new SqlConnection();
        DataSet ds = new DataSet();
        Props obj = new Props();
        obj.WiFi_id = Convert.ToString(getWiFiId());
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
            if (obj.WiFi_id == "0")
            {

            }
            else
            {
                btnSubmit.Text = "Update";
                string query = "select * from mst_wificard where id='" + obj.WiFi_id + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                adp.Fill(ds);
                //ds.Tables[0].Rows[0]["type"].ToString();
                txtBrand.Text = ds.Tables[0].Rows[0]["brand"].ToString();
                txtModel.Text = ds.Tables[0].Rows[0]["model"].ToString();

                txtStock.Text = ds.Tables[0].Rows[0]["in_stock"].ToString();
                txtPrice.Text = ds.Tables[0].Rows[0]["price"].ToString();
                txtInterface.Text = ds.Tables[0].Rows[0]["interface"].ToString();
                txtSpeed.Text = ds.Tables[0].Rows[0]["speed"].ToString();
                chbActive.Checked = ds.Tables[0].Rows[0]["isactive"].ToString() == "True" ? true : false;

            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}