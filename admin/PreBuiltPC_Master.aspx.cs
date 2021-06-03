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

public partial class admin_PreBuiltPC_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            requestData();
        }
    }

    private int getPreBuiltId()
    {
        int id;

        //if (Session["ram_id"].ToString() == "" || Session["ram_id"].ToString() == null)
        if (Session["prebuilt_id"] == null)
        {
            id = 0;
        }
        else
        {
            id = Convert.ToInt32(Session["prebuilt_id"].ToString());
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

    private void requestData()
    {
        SqlConnection conn = new SqlConnection();
        DataSet ds = new DataSet();
        Props obj = new Props();
        obj.pre_id = Convert.ToString(getPreBuiltId());
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        try
        {
            if (obj.pre_id == "0")
            {

            }
            else
            {
                btnSubmit.Text = "Update";
                string query = "select * from mst_PreBuiltPC where id='" + obj.pre_id + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                adp.Fill(ds);
                txtModel.Text = ds.Tables[0].Rows[0]["model"].ToString();
                txtBrand.Text = ds.Tables[0].Rows[0]["brand"].ToString();
                txtCooler.Text = ds.Tables[0].Rows[0]["cooler"].ToString();
                txtCPU.Text = ds.Tables[0].Rows[0]["cpu"].ToString();
                txtDetails.Text = ds.Tables[0].Rows[0]["details"].ToString();
                txtGPU.Text = ds.Tables[0].Rows[0]["gpu"].ToString();
                txtStock.Text = ds.Tables[0].Rows[0]["in_stock"].ToString();
                txtMotherboard.Text = ds.Tables[0].Rows[0]["motherboard"].ToString();
                txtCase.Text = ds.Tables[0].Rows[0]["pccase"].ToString();
                drpType.Text = ds.Tables[0].Rows[0]["pctype"].ToString(); ;
                drpPlatform.Text = ds.Tables[0].Rows[0]["platform"].ToString(); ;
                txtPrice.Text = ds.Tables[0].Rows[0]["price"].ToString();
                txtRam.Text = ds.Tables[0].Rows[0]["ram"].ToString();
                txtSMPS.Text = ds.Tables[0].Rows[0]["smps"].ToString();
                txtStorage1.Text = ds.Tables[0].Rows[0]["storage1"].ToString();
                txtStorage2.Text = ds.Tables[0].Rows[0]["storage2"].ToString();
                txtWattage.Text = ds.Tables[0].Rows[0]["wattage"].ToString();
                txtWifiCard.Text = ds.Tables[0].Rows[0]["wificard"].ToString();                
                chbActive.Checked = ds.Tables[0].Rows[0]["isactive"].ToString() == "True" ? true : false;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Props obj = new Props();
        string path = @"../assets/images/";
        obj.pre_id = Convert.ToString(getPreBuiltId());
        SqlConnection conn = new SqlConnection();
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        try
        {                      
            obj.pre_model       = txtModel.Text.Trim();
            obj.pre_brand       = txtBrand.Text.Trim();
            obj.pre_cooler      = txtCooler.Text.Trim();
            obj.pre_cpu         = txtCPU.Text.Trim();
            obj.pre_details     = txtDetails.Text.Trim();
            obj.pre_gpu         = txtGPU.Text.Trim();            
            obj.pre_in_stock    = txtStock.Text.Trim();
            obj.pre_motherboard = txtMotherboard.Text.Trim();
            obj.pre_pcCase      = txtCase.Text.Trim();
            obj.pre_pcType      = drpType.SelectedValue;
            obj.pre_platform    = drpPlatform.SelectedValue;
            obj.pre_price       = txtPrice.Text.Trim();
            obj.pre_ram         = txtRam.Text.Trim();
            obj.pre_smps        = txtSMPS.Text.Trim();
            obj.pre_storage1    = txtStorage1.Text.Trim();
            obj.pre_storage2    = txtStorage2.Text.Trim();
            obj.pre_wattage     = txtWattage.Text.Trim();
            obj.pre_wifiCard    = txtWifiCard.Text.Trim();


            //txtBrand.CssClass = "form-control border border-danger";
            // Validation
            if (obj.pre_model == "" || obj.pre_brand == "")
            {
                txtBrand.CssClass = "form-control border border-danger";

                txtModel.CssClass = "form-control border border-danger";

            }

            else
            {
                txtBrand.CssClass = "form-control border border-danger";

                txtModel.CssClass = "form-control border border-danger";

                // Insert
                if (obj.pre_id == "0")
                {

                    obj.pre_image = "No Image";
                    obj.isActive = chbActive.Checked == true ? "1" : "0";
                    obj.createAt = DateTime.Now.ToString("yyyy/MM/dd HH:mm");
                    obj.createBy = getUserInSession();
                    obj.updateAt = null;
                    obj.updateBy = "";
                    if (txtImage.HasFile)
                    {
                        //string fname = txtImage.FileName;
                        obj.pre_image = txtImage.FileName;
                        Guid objGuid = Guid.NewGuid();
                        string subGuid = Convert.ToString(objGuid);
                        subGuid = subGuid.Substring(0, 4);
                        txtImage.SaveAs(Server.MapPath(path + subGuid + obj.pre_image));
                        string imgName = subGuid + obj.pre_image;
                        //string query = "                                                      insert into mst_PreBuiltPC values('model','brand','details','pctype','stock','price','platform','cpu','motherboard','cooler','gpu','smps','ram','pcCase','storage1','storage2','wificard','wattage','image','isActive','createAt','createBy','updateAt','updateBy');";
                        
                        string query = "insert into mst_PreBuiltPC values('"+ obj.pre_model + "','"+ obj.pre_brand + "','"+ obj.pre_details + "','"+ obj.pre_pcType + "','"+ obj.pre_in_stock + "','"+ obj.pre_price + "','"+ obj.pre_platform + "','"+ obj.pre_cpu + "','"+ obj.pre_motherboard + "','"+ obj.pre_cooler + "','"+ obj.pre_gpu+ "','"+ obj.pre_smps + "','"+ obj.pre_ram+ "','"+ obj.pre_pcCase + "','"+ obj.pre_storage1 + "','"+ obj.pre_storage2 + "','"+ obj.pre_wifiCard + "','"+ obj.pre_wattage + "','"+ imgName + "','"+ obj.isActive + "','"+ obj.createAt + "','"+ obj.createBy + "','"+ obj.updateAt + "','"+ obj.updateBy + "');";

                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("prebuiltpc.aspx");
                    }
                    else
                    {
                        string query = "insert into mst_PreBuiltPC values('" + obj.pre_model + "','" + obj.pre_brand + "','" + obj.pre_details + "','" + obj.pre_pcType + "','" + obj.pre_in_stock + "','" + obj.pre_price + "','" + obj.pre_platform + "','" + obj.pre_cpu + "','" + obj.pre_motherboard + "','" + obj.pre_cooler + "','" + obj.pre_gpu + "','" + obj.pre_smps + "','" + obj.pre_ram + "','" + obj.pre_pcCase + "','" + obj.pre_storage1 + "','" + obj.pre_storage2 + "','" + obj.pre_wifiCard + "','" + obj.pre_wattage + "','" + obj.pre_image + "','" + obj.isActive + "','" + obj.createAt + "','" + obj.createBy + "','" + obj.updateAt + "','" + obj.createBy + "');";

                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("prebuiltpc.aspx");

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
                        obj.pre_image = txtImage.FileName;
                        Guid objGuid = Guid.NewGuid();
                        string subGuid = Convert.ToString(objGuid);
                        subGuid = subGuid.Substring(0, 4);
                        txtImage.SaveAs(Server.MapPath(path + subGuid + obj.pre_image));
                        string imgName = subGuid + obj.pre_image;
                        //update mst_PreBuiltPC set brand = '', cooler ='' ,cpu = '',details = '',gpu = '',image ='',in_stock = '',isActive = '',model = '',motherboard = '',pcCase = '',PCType ='',platform='',price='',ram='',smps='',storage1='',storage2='',updateAt='',updateBy='',wattage ='' ,wifiCard ='' where id = ''
                        string query = "update mst_PreBuiltPC set brand = '"+ obj.pre_brand + "', cooler ='"+ obj.pre_cooler + "' ,cpu = '"+ obj.pre_cpu + "',details = '"+ obj.pre_details + "',gpu = '"+ obj.pre_gpu + "',image ='"+ imgName + "',in_stock = '"+ obj.pre_in_stock + "',isActive = '"+ obj.isActive + "',model = '"+ obj.pre_model + "',motherboard = '"+ obj.pre_motherboard + "',pcCase = '"+ obj.pre_pcCase + "',PCType ='"+ obj.pre_pcType + "',platform='"+ obj.pre_platform + "',price='"+ obj.pre_price + "',ram='"+ obj.pre_ram + "',smps='"+ obj.pre_smps + "',storage1='"+ obj.pre_storage1 + "',storage2='"+ obj.pre_storage2 + "',updateAt='"+ obj.updateAt + "',updateBy='"+ obj.updateBy + "',wattage ='"+ obj.pre_wattage + "' ,wifiCard ='"+ obj.pre_wifiCard + "' where id = '"+ obj.pre_id + "'";
                        //update mst_PreBuiltPC set brand = '', cooler ='' ,cpu = '',details = '',gpu = '',image ='',in_stock = '',isActive = '',model = '',motherboard = '',pcCase = '',PCType ='',platform='',price='',ram='',smps='',storage1='',storage2='',updateAt='',updateBy='',wattage ='' ,wifiCard ='' where id = ''
                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("prebuiltpc.aspx");
                    }
                    else
                    {
                        string query = "update mst_PreBuiltPC set brand = '" + obj.pre_brand + "', cooler ='" + obj.pre_cooler + "' ,cpu = '" + obj.pre_cpu + "',details = '" + obj.pre_details + "',gpu = '" + obj.pre_gpu + "',in_stock = '" + obj.pre_in_stock + "',isActive = '" + obj.isActive + "',model = '" + obj.pre_model + "',motherboard = '" + obj.pre_motherboard + "',pcCase = '" + obj.pre_pcCase + "',PCType ='" + obj.pre_pcType + "',platform='" + obj.pre_platform + "',price='" + obj.pre_price + "',ram='" + obj.pre_ram + "',smps='" + obj.pre_smps + "',storage1='" + obj.pre_storage1 + "',storage2='" + obj.pre_storage2 + "',updateAt='" + obj.updateAt + "',updateBy='" + obj.updateBy + "',wattage ='" + obj.pre_wattage + "' ,wifiCard ='" + obj.pre_wifiCard + "' where id = '" + obj.pre_id + "'";

                        SqlCommand com = new SqlCommand(query, conn);
                        com.ExecuteNonQuery();
                        clear();
                        Response.Redirect("prebuiltpc.aspx");

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
            Response.Redirect("prebuiltpc.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void clear()
    {
        txtModel.Text = "";
        txtBrand.Text = "";
        txtCooler.Text      ="";
        txtCPU.Text         ="";
        txtDetails.Text     ="";
        txtGPU.Text         ="";
        txtStock.Text       ="";
        txtMotherboard.Text ="";
        txtCase.Text        ="";
        drpType.Text        ="";
        drpPlatform.Text    ="";
        txtPrice.Text       ="";
        txtRam.Text         ="";
        txtSMPS.Text        ="";
        txtStorage1.Text    ="";
        txtStorage2.Text    ="";
        txtWattage.Text     ="";
        txtWifiCard.Text = "";
    }
}