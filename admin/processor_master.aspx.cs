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

public partial class processor_master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            requestData();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Props obj = new Props();
        string path = @"../assets/images/";
        obj.processor_id = Convert.ToString(getProcessorId());
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        try
        {
            obj.processor_brand = drpBrand.SelectedValue;
            obj.processor_model = txtModel.Text.Trim();
            obj.processor_price = txtPrice.Text.Trim();
            obj.processor_stock = txtStock.Text.Trim();
            obj.processor_clock_speed = txtClock.Text.Trim();
            obj.processor_socket_type = txtSocket.Text.Trim();
            //obj.ram_size = drpSize.SelectedValue;
            //obj.ram_type = drpType.SelectedValue;
            obj.ram_price = txtPrice.Text.Trim();
            //txtBrand.CssClass = "form-control border border-danger";
            // Validation
            if (obj.processor_model == "" || drpBrand.SelectedIndex <= 0 )
            {
                drpBrand.CssClass = "form-control border border-danger";
                
                txtModel.CssClass = "form-control border border-danger";
                
            }

            else
            {
                drpBrand.CssClass = "form-control border border-danger";

                txtModel.CssClass = "form-control border border-danger";

                // Insert
                if (obj.processor_id == "0")
                {
                   
                    obj.processor_image = "No Image";
                    obj.isActive = chbActive.Checked == true ? "1" : "0";
                    obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                    obj.createBy = getUserInSession();
                    obj.updateAt = null;
                    obj.updateBy = "";
                    if (txtImage.HasFile)
                    {
                        //string fname = txtImage.FileName;
                        obj.processor_image = txtImage.FileName;
                        Guid objGuid = Guid.NewGuid();
                        string subGuid = Convert.ToString(objGuid);
                        subGuid = subGuid.Substring(0, 4);
                        txtImage.SaveAs(Server.MapPath(path + subGuid + obj.processor_image));
                        string imgName = subGuid + obj.processor_image;
                        //string query = "insert into mst_PreBuiltPC values('model','brand','details','pctype','stock','price','platform','cpu','motherboard','cooler','gpu','smps','ram','pcCase','storage1','storage2','wificard','wattage','image','isActive','createAt','createBy','updateAt','updateBy');";
                        string query = "insert into mst_processor values('" + obj.processor_model + "','" + obj.processor_brand + "','" + obj.processor_socket_type + "','" + obj.processor_clock_speed + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + imgName + "','" + obj.processor_stock + "','" + obj.processor_price + "')";

                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("processor_list.aspx");
                    }
                    else
                    {
                        string query = "insert into mst_processor values('" + obj.processor_model + "','" + obj.processor_brand + "','" + obj.processor_socket_type + "','" + obj.processor_clock_speed + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + obj.processor_image + "','" + obj.processor_stock + "','" + obj.processor_price + "')";

                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("processor_list.aspx");

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
                        obj.processor_image = txtImage.FileName;
                        Guid objGuid = Guid.NewGuid();
                        string subGuid = Convert.ToString(objGuid);
                        subGuid = subGuid.Substring(0, 4);
                        txtImage.SaveAs(Server.MapPath(path + subGuid + obj.processor_image));
                        string imgName = subGuid + obj.processor_image;
                        string query = "update mst_processor set brand = '" + obj.processor_brand + "' ,image='" + imgName + "', model = '" + obj.processor_model + "', socket_type = '" + obj.processor_socket_type + "',price = '" + obj.processor_price + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "', in_stock = '" + obj.processor_stock + "',clock_speed='" + obj.processor_clock_speed + "' where id = '" + obj.processor_id + "'";
                        //update mst_ram set brand = '', type = '', size = '', price = '', updateAt = '', updateBy = '', isActive = '', img = '', in_stock = '' where ram_id = ''
                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("processor_list.aspx");
                    }
                    else
                    {
                        string query = "update mst_processor set brand = '" + obj.processor_brand + "' , model = '" + obj.processor_model + "', socket_type = '" + obj.processor_socket_type + "',price = '" + obj.processor_price + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "', in_stock = '" + obj.processor_stock + "',clock_speed='" + obj.processor_clock_speed + "' where id = '" + obj.processor_id + "'";

                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("processor_list.aspx");

                    }
                }




            }

            conn.Close();

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
            Response.Redirect("processor_list.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private int getProcessorId()
    {
        int id;

        //if (Session["ram_id"].ToString() == "" || Session["ram_id"].ToString() == null)
        if (Session["processor_id"] == null)
        {
            id = 0;
        }
        else
        {
            id = Convert.ToInt32(Session["processor_id"].ToString());
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
        txtStock.Text = "";
        txtPrice.Text = "";
        drpBrand.SelectedIndex = 0;
        txtClock.Text = "";
        txtModel.Text = "";
        txtSocket.Text = "";
    }

    private void requestData()
    {
        SqlConnection conn = new SqlConnection();
        DataSet ds = new DataSet();
        Props obj = new Props();
        obj.processor_id = Convert.ToString(getProcessorId());
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
            if (obj.processor_id == "0")
            {

            }
            else
            {
                btnSubmit.Text = "Update";
                string query = "select * from mst_processor where id='" + obj.processor_id + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                adp.Fill(ds);
                //ds.Tables[0].Rows[0]["type"].ToString();
                drpBrand.Text = ds.Tables[0].Rows[0]["brand"].ToString();
                txtPrice.Text = ds.Tables[0].Rows[0]["price"].ToString();
                txtStock.Text = ds.Tables[0].Rows[0]["in_stock"].ToString();
                txtClock.Text = ds.Tables[0].Rows[0]["clock_speed"].ToString();
                txtSocket.Text = ds.Tables[0].Rows[0]["socket_type"].ToString();
                txtModel.Text = ds.Tables[0].Rows[0]["model"].ToString();
                
                chbActive.Checked = ds.Tables[0].Rows[0]["isactive"].ToString() == "True" ? true : false;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}