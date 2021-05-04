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

public partial class GPU_master : System.Web.UI.Page
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
        obj.GPU_id = Convert.ToString(getGPUId());
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        obj.GPU_brand = txtBrand.Text.Trim();
        obj.GPU_model = txtModel.Text.Trim();
        obj.GPU_stock = txtStock.Text.Trim();
        obj.GPU_price = txtPrice.Text.Trim();
        obj.GPU_interface = txtInterFace.Text.Trim();
        obj.GPU_ramSize = drpRamSize.SelectedValue;
        obj.GPU_ramType = drpRamType.SelectedValue;

        // Validation
        if (obj.GPU_brand == "" || obj.GPU_model == "" || drpRamType.SelectedIndex <= 0 || drpRamSize.SelectedIndex <= 0)
        {
            txtBrand.CssClass = "form-control border border-danger";
            txtModel.CssClass = "form-control border border-danger";
            drpRamType.CssClass = "form-control border border-danger";
            drpRamSize.CssClass = "form-control border border-danger";
        }
        else
        {
            txtBrand.CssClass = "form-control";
            txtModel.CssClass = "form-control";
            drpRamType.CssClass = "form-control";
            drpRamSize.CssClass = "form-control";

            // Insert
            if (obj.GPU_id == "0")
            {


                obj.GPU_image = "No Image";
                obj.isActive = chbActive.Checked == true ? "1" : "0";
                obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                obj.createBy = getUserInSession();
                obj.updateAt = null;
                obj.updateBy = "";
                if (txtImage.HasFile)
                {
                    //string fname = txtImage.FileName;
                    obj.GPU_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.GPU_image));
                    string imgName = subGuid + obj.GPU_image;
                    //string query = "insert into mst_ram values('" + obj.ram_brand + "','" + obj.ram_type + "','" + obj.ram_size + "','" + obj.ram_price + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + imgName + "','" + obj.isActive + "')";
                    string query = "insert into mst_gpu values('" + obj.GPU_model + "','" + obj.GPU_brand + "','" + obj.GPU_ramSize + "','" + obj.GPU_ramType + "','" + obj.GPU_interface + "','" + obj.GPU_price + "','" + obj.GPU_stock + "','"+imgName+"','"+obj.isActive+"','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("gpu_list.aspx");
                }
                else
                {
                    string query = "insert into mst_gpu values('" + obj.GPU_model + "','" + obj.GPU_brand + "','" + obj.GPU_ramSize + "','" + obj.GPU_ramType + "','" + obj.GPU_interface + "','" + obj.GPU_price + "','" + obj.GPU_stock + "','" + obj.GPU_image + "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("gpu_list.aspx");

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
                    obj.GPU_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.GPU_image));
                    string imgName = subGuid + obj.GPU_image;
                    string query = "update mst_gpu set brand = '" + obj.GPU_brand + "' ,image='" + imgName + "',model='" + obj.GPU_model + "',ram_size='" + obj.GPU_ramSize + "',ram_type='"+ obj.GPU_ramType + "',price='" + obj.GPU_price + "',in_stock='" + obj.GPU_stock + "',interface='"+ obj.GPU_interface + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where id = '" + obj.GPU_id + "'";
                    //update mst_ram set brand = '', type = '', size = '', price = '', updateAt = '', updateBy = '', isActive = '', img = '', in_stock = '' where ram_id = ''
                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("gpu_list.aspx");
                }
                else
                {
                    string query = "update mst_gpu set brand = '" + obj.GPU_brand + "' ,model='" + obj.GPU_model + "',ram_size='" + obj.GPU_ramSize + "',ram_type='" + obj.GPU_ramType + "',price='" + obj.GPU_price + "',in_stock='" + obj.GPU_stock + "',interface='" + obj.GPU_interface + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where id = '" + obj.GPU_id + "'";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("gpu_list.aspx");

                }
            }

        }


    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        try
        {

            Response.Redirect("gpu_list.aspx");
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
        txtInterFace.Text = "";
        txtPrice.Text = "";
        drpRamSize.SelectedIndex = 0;
        drpRamType.SelectedIndex = 0;

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

    private int getGPUId()
    {
        int id;

        //if (Session["ram_id"].ToString() == "" || Session["ram_id"].ToString() == null)
        if (Session["gpu_id"] == null)
        {
            id = 0;
        }
        else
        {
            id = Convert.ToInt32(Session["gpu_id"].ToString());
        }
        return id;

    }

    private void requestData()
    {
        SqlConnection conn = new SqlConnection();
        DataSet ds = new DataSet();
        Props obj = new Props();
        obj.GPU_id = Convert.ToString(getGPUId());
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
            if (obj.GPU_id == "0")
            {

            }
            else
            {
                btnSubmit.Text = "Update";
                string query = "select * from mst_gpu where id='" + obj.GPU_id + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                adp.Fill(ds);
                //ds.Tables[0].Rows[0]["type"].ToString();
                txtBrand.Text = ds.Tables[0].Rows[0]["brand"].ToString();
                txtModel.Text = ds.Tables[0].Rows[0]["model"].ToString();
                txtInterFace.Text = ds.Tables[0].Rows[0]["interface"].ToString();
                txtStock.Text = ds.Tables[0].Rows[0]["in_stock"].ToString();
                txtPrice.Text = ds.Tables[0].Rows[0]["price"].ToString();
                drpRamSize.Text = ds.Tables[0].Rows[0]["ram_size"].ToString();
                drpRamType.Text = ds.Tables[0].Rows[0]["ram_type"].ToString();
                chbActive.Checked = ds.Tables[0].Rows[0]["isactive"].ToString() == "True" ? true : false;

            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}