using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Propcs
/// </summary>
public class Props
{
    #region User 
    public string id { get; set; }
    public string userName { get; set; }
    public string firstName { get; set; }
    public string lastName { get; set; }
    public string password { get; set; }
    public string email { get; set; }
    public string contact { get; set; }
    public string address { get; set; }
    public string dob { get; set; }
    public string userType { get; set; }
    public string isActive { get; set; }
    public string createBy { get; set; }
    public string createAt { get; set; }
    public string updateBy { get; set; }
    public string updateAt { get; set; }

    #endregion

    #region RAM
    public string ram_id { get; set; }
    public string ram_brand { get; set; }
    public string ram_size { get; set; }
    public string ram_type { get; set; }
    public string ram_price { get; set; }
    public string ram_stock { get; set; }
    public string ram_img { get; set; }
    public string ram_frequency { get; set; }
    public string ram_channel { get; set; }
    public string ram_model { get; set; }
    #endregion

    #region Platform
    public string platform_id { get; set; }
    public string platform_name { get; set; }
    public string platform_brand { get; set; }
    public string platform_image { get; set; }
    #endregion

    #region Processor
    public string processor_id { get; set; }
    public string processor_model { get; set; }
    public string processor_brand { get; set; }
    public string processor_clock_speed { get; set; }
    public string processor_socket_type { get; set; }
    public string processor_price { get; set; }
    public string processor_stock { get; set; }
    public string processor_image { get; set; }
    #endregion

    #region MotherBoard
    public string motherboard_id { get; set; }
    public string motherboard_brand { get; set; }
    public string motherboard_model { get; set; }
    public string motherboard_storage { get; set; }
    public string motherboard_stock { get; set; }
    public string motherboard_price { get; set; }
    public string motherboard_image { get; set; }

    #endregion

    #region GPU
    public string GPU_id { get; set; }
    public string GPU_model { get; set; }
    public string GPU_brand { get; set; }
    public string GPU_ramType { get; set; }
    public string GPU_ramSize { get; set; }
    public string GPU_interface { get; set; }
    public string GPU_image { get; set; }
    public string GPU_price { get; set; }
    public string GPU_stock { get; set; }

    #endregion

    #region SMPS   
    public string SMPS_id { get; set; }
    public string SMPS_model { get; set; }
    public string SMPS_brand { get; set; }
    public string SMPS_wattage { get; set; }
    public string SMPS_price { get; set; }
    public string SMPS_stock { get; set; }
    public string SMPS_image { get; set; }
    #endregion

    #region Cooler
    public string Cooler_id { get; set; }
    public string Cooler_model { get; set; }
    public string Cooler_brand { get; set; }
    public string Cooler_wattage { get; set; }
    public string Cooler_price { get; set; }
    public string Cooler_stock { get; set; }
    public string Cooler_image { get; set; }
    #endregion
    public Props()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}