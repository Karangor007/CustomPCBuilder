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

public partial class RAM_Master : System.Web.UI.Page
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
        obj.ram_id = Convert.ToString(getRamId());
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        try
        {
            obj.ram_brand = txtBrand.Text.Trim();
            obj.ram_model = txtModel.Text.Trim();
            obj.ram_frequency = txtFrequency.Text.Trim();
            obj.ram_channel = txtChannel.Text.Trim();
            //obj.ram_size = drpSize.SelectedValue;
            //obj.ram_type = drpType.SelectedValue;
            obj.ram_price = txtPrice.Text.Trim();
            //txtBrand.CssClass = "form-control border border-danger";
            // Validation
            if (obj.ram_brand == "" || obj.ram_price == "" || drpType.SelectedIndex <= 0 || drpSize.SelectedIndex <= 0 || obj.ram_model == "" || obj.ram_frequency == "" || obj.ram_channel == "")
            {
                txtBrand.CssClass = "form-control border border-danger";
                txtPrice.CssClass = "form-control border border-danger";
                txtModel.CssClass = "form-control border border-danger";
                txtChannel.CssClass = "form-control border border-danger";
                txtFrequency.CssClass = "form-control border border-danger";
                drpSize.CssClass = "form-control border border-danger";
                drpType.CssClass = "form-control border border-danger";
            }

            else
            {
                txtBrand.CssClass = "form-control ";
                txtPrice.CssClass = "form-control ";
                txtModel.CssClass = "form-control ";
                txtFrequency.CssClass = "form-control ";
                txtChannel.CssClass = "form-control ";
                drpSize.CssClass = "form-control ";
                drpType.CssClass = "form-control ";

                // Insert
                if (obj.ram_id == "0")
                {
                    obj.ram_brand = txtBrand.Text.Trim();
                    obj.ram_size = drpSize.SelectedValue;
                    obj.ram_type = drpType.SelectedValue;
                    obj.ram_price = txtPrice.Text.Trim();
                    obj.ram_stock = txtStock.Text.Trim();
                    obj.ram_model = txtModel.Text.Trim();
                    obj.ram_frequency = txtFrequency.Text.Trim();
                    obj.ram_channel = txtChannel.Text.Trim();
                    obj.ram_img = "No Image";
                    obj.isActive = chbActive.Checked == true ? "1" : "0";
                    obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                    obj.createBy = getUserInSession();
                    obj.updateAt = null;
                    obj.updateBy = "";
                    if (txtImage.HasFile)
                    {
                        //string fname = txtImage.FileName;
                        obj.ram_img = txtImage.FileName;
                        Guid objGuid = Guid.NewGuid();
                        string subGuid = Convert.ToString(objGuid);
                        subGuid = subGuid.Substring(0, 4);
                        txtImage.SaveAs(Server.MapPath(path + subGuid + obj.ram_img));
                        string imgName = subGuid + obj.ram_img;
                        //string query = "insert into mst_ram values('" + obj.ram_brand + "','" + obj.ram_type + "','" + obj.ram_size + "','" + obj.ram_price + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + imgName + "','" + obj.isActive + "')";
                        string query = "insert into mst_ram values('" + obj.ram_brand + "','" + obj.ram_type + "','" + obj.ram_size + "','" + obj.ram_price + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + imgName + "','" + obj.ram_stock + "','" + obj.ram_frequency + "','" + obj.ram_channel + "','" + obj.ram_model + "')";

                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("ram_list.aspx");
                    }
                    else
                    {
                        string query = "insert into mst_ram values('" + obj.ram_brand + "','" + obj.ram_type + "','" + obj.ram_size + "','" + obj.ram_price + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + obj.ram_img + "','" + obj.ram_stock + "','"+obj.ram_frequency+"','"+obj.ram_channel+"','"+obj.ram_model+"')";

                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("ram_list.aspx");

                    }
                }
                // Update
                else
                {
                    obj.ram_brand = txtBrand.Text.Trim();
                    obj.ram_size = drpSize.SelectedValue;
                    obj.ram_type = drpType.SelectedValue;
                    obj.ram_price = txtPrice.Text.Trim();
                    obj.ram_stock = txtStock.Text.Trim();
                    obj.ram_model = txtModel.Text.Trim();
                    obj.ram_frequency = txtFrequency.Text.Trim();
                    obj.ram_channel = txtChannel.Text.Trim();
                    //obj.ram_img = "No Image";
                    obj.isActive = chbActive.Checked == true ? "1" : "0";
                    //obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                    //obj.createBy = getUserInSession();
                    obj.updateAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm"); ;
                    obj.updateBy = getUserInSession();
                    if (txtImage.HasFile)
                    {
                        //string fname = txtImage.FileName;
                        obj.ram_img = txtImage.FileName;
                        Guid objGuid = Guid.NewGuid();
                        string subGuid = Convert.ToString(objGuid);
                        subGuid = subGuid.Substring(0, 4);
                        txtImage.SaveAs(Server.MapPath(path + subGuid + obj.ram_img));
                        string imgName = subGuid + obj.ram_img;
                        string query = "update mst_ram set brand = '" + obj.ram_brand + "' ,img='"+imgName+"', type = '" + obj.ram_type + "', size = '" + obj.ram_size + "',price = '" + obj.ram_price + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "', in_stock = '" + obj.ram_stock + "',frequency='" + obj.ram_frequency + "',channel='" + obj.ram_channel + "',model='" + obj.ram_model + "' where ram_id = '" + obj.ram_id + "'";
                        //update mst_ram set brand = '', type = '', size = '', price = '', updateAt = '', updateBy = '', isActive = '', img = '', in_stock = '' where ram_id = ''
                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("ram_list.aspx");
                    }
                    else
                    {
                        string query = "update mst_ram set brand = '" + obj.ram_brand + "' , type = '" + obj.ram_type + "', size = '" + obj.ram_size + "',price = '" + obj.ram_price + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "', in_stock = '" + obj.ram_stock + "',frequency='"+obj.ram_frequency+"',channel='"+obj.ram_channel+"',model='"+obj.ram_model+"' where ram_id = '" + obj.ram_id + "'";

                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("ram_list.aspx");

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

    private void clear()
    {
        txtBrand.Text = "";
        txtPrice.Text = "";
        drpSize.SelectedIndex = 0;
        drpType.SelectedIndex = 0;
        txtStock.Text = "";
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

    private int getRamId()
    {
        int id;

        //if (Session["ram_id"].ToString() == "" || Session["ram_id"].ToString() == null)
        if(Session["ram_id"] == null)
        {
            id = 0;
        }
        else
        {
            id = Convert.ToInt32(Session["ram_id"].ToString());
        }
        return id;

    }

    private void requestData()
    {
        SqlConnection conn = new SqlConnection();
        DataSet ds = new DataSet();
        Props obj = new Props();
        obj.ram_id = Convert.ToString(getRamId());
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
            if (obj.ram_id == "0")
            {

            }
            else
            {
                btnSubmit.Text = "Update";
                string query = "select * from mst_ram where ram_id='" + obj.ram_id + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                adp.Fill(ds);
                //ds.Tables[0].Rows[0]["type"].ToString();
                txtBrand.Text = ds.Tables[0].Rows[0]["brand"].ToString();
                txtPrice.Text = ds.Tables[0].Rows[0]["price"].ToString();
                txtStock.Text = ds.Tables[0].Rows[0]["in_stock"].ToString();
                txtFrequency.Text = ds.Tables[0].Rows[0]["frequency"].ToString();
                txtChannel.Text = ds.Tables[0].Rows[0]["channel"].ToString();
                txtModel.Text = ds.Tables[0].Rows[0]["model"].ToString();
                drpSize.Text = ds.Tables[0].Rows[0]["size"].ToString();
                drpType.Text = ds.Tables[0].Rows[0]["type"].ToString();
                chbActive.Checked = ds.Tables[0].Rows[0]["isactive"].ToString() == "True" ? true : false;
            }


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
            
            Response.Redirect("ram_list.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}