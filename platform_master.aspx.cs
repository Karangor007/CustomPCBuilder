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

public partial class platform_master : System.Web.UI.Page
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
        string path = "assets/images/";
        obj.platform_id = Convert.ToString(getPlatformId());
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        obj.platform_brand = txtBrand.Text.Trim();
        obj.platform_name = txtName.Text.Trim();

        // Validation
        if (obj.platform_brand == "" || obj.platform_name == "")
        {
            txtBrand.CssClass = "form-control border border-danger";
            txtName.CssClass = "form-control border border-danger";
        }
        else
        {
            txtBrand.CssClass = "form-control";
            txtName.CssClass = "form-control";

            // Insert
            if (obj.platform_id == "0")
            {


                obj.platform_image = "No Image";
                obj.isActive = chbActive.Checked == true ? "1" : "0";
                obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                obj.createBy = getUserInSession();
                obj.updateAt = null;
                obj.updateBy = "";
                if (txtImage.HasFile)
                {
                    //string fname = txtImage.FileName;
                    obj.platform_image = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.platform_image));
                    string imgName = subGuid + obj.platform_image;
                    //string query = "insert into mst_ram values('" + obj.ram_brand + "','" + obj.ram_type + "','" + obj.ram_size + "','" + obj.ram_price + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + imgName + "','" + obj.isActive + "')";
                    string query = "insert into mst_platform values('" + obj.platform_name + "','" + obj.platform_brand + "','" + obj.createBy + "','" + obj.createAt + "','" + obj.updateBy + "','" + obj.updateAt + "','" + obj.isActive + "','" + imgName + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("platform_list.aspx");
                }
                else
                {
                    string query = "insert into mst_platform values('" + obj.platform_name + "','" + obj.platform_brand + "','" + obj.createBy + "','" + obj.createAt + "','" + obj.updateBy + "','" + obj.updateAt + "','" + obj.isActive + "','" + obj.platform_name + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("platform_list.aspx");

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
                    obj.platform_name = txtImage.FileName;
                    Guid objGuid = Guid.NewGuid();
                    string subGuid = Convert.ToString(objGuid);
                    subGuid = subGuid.Substring(0, 4);
                    txtImage.SaveAs(Server.MapPath(path + subGuid + obj.platform_name));
                    string imgName = subGuid + obj.platform_name;
                    string query = "update mst_platform set brand = '" + obj.platform_brand + "' ,image='" + imgName + "',name='"+obj.platform_name+"',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where pt_id = '" + obj.platform_id + "'";
                    //update mst_ram set brand = '', type = '', size = '', price = '', updateAt = '', updateBy = '', isActive = '', img = '', in_stock = '' where ram_id = ''
                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("platform_list.aspx");
                }
                else
                {
                    string query = "update mst_platform set brand = '" + obj.platform_brand + "' ,name='" + obj.platform_name + "',updateAt = '" + obj.updateAt + "',updateBy = '" + obj.updateBy + "',isActive ='" + obj.isActive + "' where pt_id = '" + obj.platform_id + "'";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("platform_list.aspx");

                }
            }

        }


    }

    private void requestData()
    {
        SqlConnection conn = new SqlConnection();
        DataSet ds = new DataSet();
        Props obj = new Props();
        obj.platform_id = Convert.ToString(getPlatformId());
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
            if (obj.platform_id == "0")
            {

            }
            else
            {
                btnSubmit.Text = "Update";
                string query = "select * from mst_platform where pt_id='" + obj.platform_id + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                adp.Fill(ds);
                //ds.Tables[0].Rows[0]["type"].ToString();
                txtBrand.Text = ds.Tables[0].Rows[0]["brand"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["name"].ToString();                
                chbActive.Checked = ds.Tables[0].Rows[0]["isactive"].ToString() == "True" ? true : false;

            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private int getPlatformId()
    {
        int id;

        //if (Session["ram_id"].ToString() == "" || Session["ram_id"].ToString() == null)
        if (Session["platform_id"] == null)
        {
            id = 0;
        }
        else
        {
            id = Convert.ToInt32(Session["platform_id"].ToString());
        }
        return id;

    }

    private void clear()
    {
        txtBrand.Text = "";
        txtName.Text = "";
        
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

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        try
        {

            Response.Redirect("platform_list.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}