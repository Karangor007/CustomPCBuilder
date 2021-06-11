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

public partial class admin_Product_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            requestData();
            bindProductType();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Props obj = new Props();
        string path = @"../assets/images/";
        obj.Product_id = Convert.ToString(getProductId());
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        obj.Product_brand = txtBrand.Text.Trim();
        obj.Product_model = txtModel.Text.Trim();
        obj.Product_stock = txtStock.Text.Trim();
        obj.Product_price = txtPrice.Text.Trim();                
        obj.Product_type = drpType.SelectedValue;
        obj.Product_details = txtDetails.Text.Trim();

        // Validation
        if (obj.Product_brand == "" || obj.Product_model == "" || drpType.SelectedIndex <= 0 )
        {
            txtBrand.CssClass = "form-control border border-danger";
            txtModel.CssClass = "form-control border border-danger";
            drpType.CssClass = "form-control border border-danger";
            
        }
        else
        {
            txtBrand.CssClass = "form-control";
            txtModel.CssClass = "form-control";
            drpType.CssClass = "form-control";
            
            // Insert
            if (obj.Product_id == "0")
            {


                obj.Product_image = "No Image";
                obj.isActive = chbActive.Checked == true ? "1" : "0";
                obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                obj.createBy = getUserInSession();
                obj.updateAt = null;
                obj.updateBy = "";
                if (txtImage.HasFile)
                {
                    //string fname = txtImage.FileName;
                    obj.Product_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.Product_image));
                    string imgName = subGuid + obj.Product_image;
                    //string query = "insert into mst_ram values('" + obj.ram_brand + "','" + obj.ram_type + "','" + obj.ram_size + "','" + obj.ram_price + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + imgName + "','" + obj.isActive + "')";
                    string query = "insert into mst_products values('" + obj.Product_model + "','" + obj.Product_brand + "','" + obj.Product_price + "','" + obj.Product_stock + "','" + obj.Product_type + "','" + imgName + "','" + obj.Product_details + "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("products.aspx");
                }
                else
                {
                    string query = "insert into mst_products values('" + obj.Product_model + "','" + obj.Product_brand + "','" + obj.Product_price + "','" + obj.Product_stock + "','" + obj.Product_type + "','" + obj.Product_image + "','" + obj.Product_details + "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("products.aspx");

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
                    obj.Product_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.Product_image));
                    string imgName = subGuid + obj.Product_image;
                    string query = "update mst_products set brand = '" + obj.Product_brand + "' ,image='" + imgName + "',model='" + obj.Product_model + "',type='" + obj.Product_type + "',price='" + obj.Product_price + "',in_stock='" + obj.Product_stock + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where id = '" + obj.Product_id + "'";
                    //update mst_ram set brand = '', type = '', size = '', price = '', updateAt = '', updateBy = '', isActive = '', img = '', in_stock = '' where ram_id = ''
                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("products.aspx");
                }
                else
                {
                    string query = "update mst_products set brand = '" + obj.Product_brand + "' ,model='" + obj.Product_model + "',type='" + obj.Product_type + "',price='" + obj.Product_price + "',in_stock='" + obj.Product_stock + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where id = '" + obj.Product_id + "'";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("products.aspx");

                }
            }

        }


    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("products.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void clear()
    {
        txtBrand.Text = "";
        txtModel.Text = "";
        txtStock.Text = "";
        txtDetails.Text = "";
        txtPrice.Text = "";
        drpType.SelectedIndex = 0;
        

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

    private int getProductId()
    {
        int id;

        //if (Session["ram_id"].ToString() == "" || Session["ram_id"].ToString() == null)
        if (Session["product_id"] == null)
        {
            id = 0;
        }
        else
        {
            id = Convert.ToInt32(Session["product_id"].ToString());
        }
        return id;

    }

    private void requestData()
    {
        SqlConnection conn = new SqlConnection();
        DataSet ds = new DataSet();
        Props obj = new Props();
        obj.Product_id = Convert.ToString(getProductId());
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
            if (obj.Product_id == "0")
            {

            }
            else
            {
                //bindProductType();
                btnSubmit.Text = "Update";
                string query = "select * from mst_products where id='" + obj.Product_id + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                adp.Fill(ds);
                //ds.Tables[0].Rows[0]["type"].ToString();
                txtBrand.Text = ds.Tables[0].Rows[0]["brand"].ToString();
                txtModel.Text = ds.Tables[0].Rows[0]["model"].ToString();                
                txtStock.Text = ds.Tables[0].Rows[0]["in_stock"].ToString();
                txtPrice.Text = ds.Tables[0].Rows[0]["price"].ToString();
                txtDetails.Text = ds.Tables[0].Rows[0]["details"].ToString();
                drpType.Items.Insert(0, new ListItem("Please Select Type"));
                drpType.SelectedValue = ds.Tables[0].Rows[0]["type"].ToString();
                chbActive.Checked = ds.Tables[0].Rows[0]["isactive"].ToString() == "True" ? true : false;

            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void bindProductType()
    {
        try
        {
            SqlConnection conn = new SqlConnection();
            DataSet ds = new DataSet();
            Props obj = new Props();
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
            string query = "select * from mst_product_cat where isActive = 1";
            SqlDataAdapter adp = new SqlDataAdapter(query, conn);
            adp.Fill(ds);
            drpType.DataSource = ds.Tables[0];
            
            drpType.DataTextField = "name";
            drpType.DataValueField = "id";
            drpType.DataBind();
            drpType.Items.Insert(0,new ListItem("Please Select Type"));

        }
        catch (Exception ex)
        {

        }
    }
}