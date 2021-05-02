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

public partial class Storage_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            requestData();
        }
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        try
        {

            Response.Redirect("Storage_list.aspx");
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
        obj.Storage_id = Convert.ToString(getStorageId());
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        obj.Storage_brand = txtBrand.Text.Trim();
        obj.Storage_model = txtModel.Text.Trim();
        obj.Storage_stock = txtStock.Text.Trim();
        obj.Storage_price = txtPrice.Text.Trim();
        obj.Storage_interface = txtInterface.Text.Trim();
        obj.Storage_size = drpSize.SelectedValue;


        // Validation
        if (obj.Storage_brand == "" || obj.Storage_model == "" || drpSize.SelectedIndex <= 0)
        {
            txtBrand.CssClass = "form-control border border-danger";
            txtModel.CssClass = "form-control border border-danger";
            drpSize.CssClass = "form-control border border-danger";

        }
        else
        {
            txtBrand.CssClass = "form-control";
            txtModel.CssClass = "form-control";
            drpSize.CssClass = "form-control";


            // Insert
            if (obj.Storage_id == "0")
            {


                obj.Storage_image = "No Image";
                obj.isActive = chbActive.Checked == true ? "1" : "0";
                obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                obj.createBy = getUserInSession();
                obj.updateAt = null;
                obj.updateBy = "";
                if (txtImage.HasFile)
                {
                    //string fname = txtImage.FileName;
                    obj.Storage_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.Storage_image));
                    string imgName = subGuid + obj.Storage_image;
                    //string query = "insert into mst_ram values('" + obj.ram_brand + "','" + obj.ram_type + "','" + obj.ram_size + "','" + obj.ram_price + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + imgName + "','" + obj.isActive + "')";
                    string query = "insert into mst_storage values('" + obj.Storage_model + "','" + obj.Storage_brand + "','" + obj.Storage_size + "','"+ obj.Storage_interface + "','" + obj.Storage_price + "','" + obj.Storage_stock + "','" + imgName + "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("Storage_list.aspx");
                }
                else
                {
                    string query = "insert into mst_storage values('" + obj.Storage_model + "','" + obj.Storage_brand + "','" + obj.Storage_size + "','" + obj.Storage_interface + "','" + obj.Storage_price + "','" + obj.Storage_stock + "','" + obj.Storage_image + "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("Storage_list.aspx");

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
                    obj.Storage_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.Storage_image));
                    string imgName = subGuid + obj.Storage_image;
                    string query = "update mst_storage set brand = '" + obj.Storage_brand + "' ,image='" + imgName + "',model='" + obj.Storage_model + "',size='" + obj.Storage_size + "',interface='"+ obj.Storage_interface + "',price='" + obj.Storage_price + "',in_stock='" + obj.Storage_stock + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where id = '" + obj.Storage_id + "'";
                    //update mst_ram set brand = '', type = '', size = '', price = '', updateAt = '', updateBy = '', isActive = '', img = '', in_stock = '' where ram_id = ''
                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("Storage_list.aspx");
                }
                else
                {
                    string query = "update mst_storage set brand = '" + obj.Storage_brand + "' ,model='" + obj.Storage_model + "',size='" + obj.Storage_size + "',interface='" + obj.Storage_interface + "',price='" + obj.Storage_price + "',in_stock='" + obj.Storage_stock + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where id = '" + obj.Storage_id + "'";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("Storage_list.aspx");

                }
            }

        }

    }

    private void requestData()
    {
        SqlConnection conn = new SqlConnection();
        DataSet ds = new DataSet();
        Props obj = new Props();
        obj.Storage_id = Convert.ToString(getStorageId());
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
            if (obj.Storage_id == "0")
            {

            }
            else
            {
                btnSubmit.Text = "Update";
                string query = "select * from mst_storage where id='" + obj.Storage_id + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                adp.Fill(ds);
                //ds.Tables[0].Rows[0]["type"].ToString();
                txtBrand.Text = ds.Tables[0].Rows[0]["brand"].ToString();
                txtModel.Text = ds.Tables[0].Rows[0]["model"].ToString();

                txtStock.Text = ds.Tables[0].Rows[0]["in_stock"].ToString();
                txtPrice.Text = ds.Tables[0].Rows[0]["price"].ToString();
                txtInterface.Text = ds.Tables[0].Rows[0]["interface"].ToString();
                drpSize.Text = ds.Tables[0].Rows[0]["size"].ToString();
                chbActive.Checked = ds.Tables[0].Rows[0]["isactive"].ToString() == "True" ? true : false;

            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private int getStorageId()
    {
        int id;

        //if (Session["ram_id"].ToString() == "" || Session["ram_id"].ToString() == null)
        if (Session["storage_id"] == null)
        {
            id = 0;
        }
        else
        {
            id = Convert.ToInt32(Session["storage_id"].ToString());
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
        drpSize.SelectedIndex = 0;
        txtInterface.Text = "";


    }
}