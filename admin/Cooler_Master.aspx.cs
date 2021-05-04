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

public partial class Cooler_Master : System.Web.UI.Page
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
        obj.Cooler_id = Convert.ToString(getCoolerId());
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        obj.Cooler_brand = txtBrand.Text.Trim();
        obj.Cooler_model = txtModel.Text.Trim();
        obj.Cooler_stock = txtStock.Text.Trim();
        obj.Cooler_price = txtPrice.Text.Trim();
        obj.Cooler_wattage = txtWattage.Text.Trim();


        // Validation
        if (obj.Cooler_brand == "" || obj.Cooler_model == "" || obj.Cooler_wattage == "")
        {
            txtBrand.CssClass = "form-control border border-danger";
            txtModel.CssClass = "form-control border border-danger";
            txtWattage.CssClass = "form-control border border-danger";

        }
        else
        {
            txtBrand.CssClass = "form-control";
            txtModel.CssClass = "form-control";
            txtWattage.CssClass = "form-control";


            // Insert
            if (obj.Cooler_id == "0")
            {


                obj.Cooler_image = "No Image";
                obj.isActive = chbActive.Checked == true ? "1" : "0";
                obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                obj.createBy = getUserInSession();
                obj.updateAt = null;
                obj.updateBy = "";
                if (txtImage.HasFile)
                {
                    //string fname = txtImage.FileName;
                    obj.Cooler_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.Cooler_image));
                    string imgName = subGuid + obj.Cooler_image;
                    //string query = "insert into mst_ram values('" + obj.ram_brand + "','" + obj.ram_type + "','" + obj.ram_size + "','" + obj.ram_price + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + imgName + "','" + obj.isActive + "')";
                    string query = "insert into mst_cooler values('" + obj.Cooler_model + "','" + obj.Cooler_brand + "','" + obj.Cooler_wattage + "','" + obj.Cooler_price + "','" + obj.Cooler_stock + "','" + imgName + "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("Cooler_list.aspx");
                }
                else
                {
                    string query = "insert into mst_cooler values('" + obj.Cooler_model + "','" + obj.Cooler_brand + "','" + obj.Cooler_wattage + "','" + obj.Cooler_price + "','" + obj.Cooler_stock + "','" + obj.Cooler_image + "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("Cooler_list.aspx");

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
                    obj.Cooler_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.Cooler_image));
                    string imgName = subGuid + obj.Cooler_image;
                    string query = "update mst_cooler set brand = '" + obj.Cooler_brand + "' ,image='" + imgName + "',model='" + obj.Cooler_model + "',wattage='" + obj.Cooler_wattage + "',price='" + obj.Cooler_price + "',in_stock='" + obj.Cooler_stock + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where id = '" + obj.Cooler_id + "'";
                    //update mst_ram set brand = '', type = '', size = '', price = '', updateAt = '', updateBy = '', isActive = '', img = '', in_stock = '' where ram_id = ''
                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("Cooler_list.aspx");
                }
                else
                {
                    string query = "update mst_cooler set brand = '" + obj.Cooler_brand + "' ,model='" + obj.Cooler_model + "',wattage='" + obj.Cooler_wattage + "',price='" + obj.Cooler_price + "',in_stock='" + obj.Cooler_stock + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where id = '" + obj.Cooler_id + "'";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("Cooler_list.aspx");

                }
            }

        }


    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        try
        {

            Response.Redirect("Cooler_list.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void requestData()
    {
        SqlConnection conn = new SqlConnection();
        DataSet ds = new DataSet();
        Props obj = new Props();
        obj.Cooler_id = Convert.ToString(getCoolerId());
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
            if (obj.Cooler_id == "0")
            {

            }
            else
            {
                btnSubmit.Text = "Update";
                string query = "select * from mst_cooler where id='" + obj.Cooler_id + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                adp.Fill(ds);
                //ds.Tables[0].Rows[0]["type"].ToString();
                txtBrand.Text = ds.Tables[0].Rows[0]["brand"].ToString();
                txtModel.Text = ds.Tables[0].Rows[0]["model"].ToString();

                txtStock.Text = ds.Tables[0].Rows[0]["in_stock"].ToString();
                txtPrice.Text = ds.Tables[0].Rows[0]["price"].ToString();

                txtWattage.Text = ds.Tables[0].Rows[0]["wattage"].ToString();
                chbActive.Checked = ds.Tables[0].Rows[0]["isactive"].ToString() == "True" ? true : false;

            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private int getCoolerId()
    {
        int id;

        //if (Session["ram_id"].ToString() == "" || Session["ram_id"].ToString() == null)
        if (Session["cooler_id"] == null)
        {
            id = 0;
        }
        else
        {
            id = Convert.ToInt32(Session["cooler_id"].ToString());
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
        txtWattage.Text = "";


    }
}