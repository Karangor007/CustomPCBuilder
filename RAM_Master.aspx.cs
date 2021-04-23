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

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Props obj = new Props();
        string path = "assets/images/";
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        try
        {
            obj.ram_brand = txtBrand.Text.Trim();
            //obj.ram_size = drpSize.SelectedValue;
            //obj.ram_type = drpType.SelectedValue;
            obj.ram_price = txtPrice.Text.Trim();
            //txtBrand.CssClass = "form-control border border-danger";
            // Validation
            if (obj.ram_brand == "" || obj.ram_price == "" || drpType.SelectedIndex <= 0 || drpSize.SelectedIndex <= 0)
            {
                txtBrand.CssClass = "form-control border border-danger";
                txtPrice.CssClass = "form-control border border-danger";
                drpSize.CssClass = "form-control border border-danger";
                drpType.CssClass = "form-control border border-danger";
            }

            else
            {
                txtBrand.CssClass = "form-control ";
                txtPrice.CssClass = "form-control ";
                drpSize.CssClass = "form-control ";
                drpType.CssClass = "form-control ";
                

                obj.ram_brand = txtBrand.Text.Trim();
                obj.ram_size = drpSize.SelectedValue;
                obj.ram_type = drpType.SelectedValue;
                obj.ram_price = txtPrice.Text.Trim();
                obj.ram_stock = txtStock.Text.Trim();
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
                    subGuid = subGuid.Substring(0,4);
                    txtImage.SaveAs(Server.MapPath(path+ subGuid + obj.ram_img ));
                    string imgName = subGuid + obj.ram_img ;
                    string query = "insert into mst_ram values('"+obj.ram_brand+"','"+obj.ram_type+"','"+obj.ram_size+"','"+obj.ram_price+"','"+obj.createAt+"','"+obj.createBy+"','"+obj.updateAt+"','"+obj.updateBy+"','"+obj.isActive+"','"+ imgName +"','" +obj.isActive+"')";

                    SqlCommand com = new SqlCommand(query,conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("ram_list.aspx");
                }
                else
                {
                    string query = "insert into mst_ram values('" + obj.ram_brand + "','" + obj.ram_type + "','" + obj.ram_size + "','" + obj.ram_price + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.updateBy + "','" + obj.isActive + "','" + obj.ram_img + "','" + obj.isActive + "')";

                    SqlCommand com = new SqlCommand(query, conn);
                    com.ExecuteNonQuery();
                    clear();
                    Response.Redirect("ram_list.aspx");

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

        if (Session["username"].ToString() == null || Session["username"].ToString() == "")
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
}